//
//  SearchViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/11.
//

import UIKit
import MapKit
import CoreLocation

class SearchViewController: UIViewController, DataSendDelegate, UIViewControllerTransitioningDelegate{
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var searchBarBtn: UIButton!
    @IBOutlet var filterBtn: UIButton!
    @IBOutlet var filterCntLabel: UILabel!
    @IBOutlet var locationBtns: [UIButton]!
    
    var selectedFilters: Set<String> = []
    weak var dataSendDelegate: DataSendDelegate?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpMap()
    }
    
    func setUpUI(){
        filterBtn.addTarget(self, action: #selector(filterBtnTapped), for: .touchUpInside)
        filterCntLabel.isHidden = true
        filterBtn.layer.borderWidth = 0.8
        for btn in locationBtns{
            btn.addTarget(self, action: #selector(locationBtnTapped(_:)), for: .touchUpInside)
            btn.layer.borderWidth = 0.8
        }
        updateFilterBtnState()
        updateLocationBtnState()
    }
    
    //필터 선택 화면에서 선택한 data애 따라 UI 갱신
    func didReceiveData(data: Set<String>) {
        selectedFilters = data
        updateFilterBtnState()
        updateLocationBtnState()
    }
    
    //필터의 선택 갯수에 따라 필터 버튼 테두리를 변경
    func updateFilterBtnState(){
        if !selectedFilters.isEmpty{
            filterBtn.layer.borderColor = UIColor(named: "White")!.cgColor
            filterCntLabel.text = String(selectedFilters.count)
            filterCntLabel.isHidden = false
        }
        else{
            filterBtn.layer.borderColor = UIColor(named: "G4")!.cgColor
            filterCntLabel.isHidden = true
        }
    }
    
    //버튼의 선택 상태에 따라 지역 버튼 테두리를 변경
    func updateLocationBtnState(){
        for btn in locationBtns{
            if selectedFilters.contains(btn.titleLabel!.text!){
                btn.layer.borderColor = UIColor(named: "White")?.cgColor
            }
            else{
                btn.layer.borderColor = UIColor(named: "G4")?.cgColor
            }
        }
    }
    
    //검색 바 tap
    @IBAction func searchBarBtnTapped(_ sender: Any) {
        let searchDetailVC = self.storyboard?.instantiateViewController(identifier: "searchDetailVC") as! SearchDetailViewController
        
        searchDetailVC.modalPresentationStyle = .fullScreen
        self.present(searchDetailVC, animated: true, completion: nil)
        
    }
    
    //필터 버튼 눌렸을때 동작 (half modal로 페이지 이동)
    @objc func filterBtnTapped() {
        let filterVC = self.storyboard?.instantiateViewController(identifier: "filterVC") as! FilterViewController
        filterVC.dataSendDelegate = self
        filterVC.selectedFilters = self.selectedFilters
        filterVC.modalPresentationStyle = .pageSheet
        
        if #available(iOS 15.0, *) {
            if let sheet = filterVC.sheetPresentationController {
                sheet.delegate = self
                //지원할 크기 지정
                sheet.detents = [.medium(), .large()]
                //뒷 배경 흐리게 안함
                sheet.largestUndimmedDetentIdentifier = .medium
                //시트 상단에 그래버 표시
                sheet.prefersGrabberVisible = true
            }
        } else {
            print("ios 15 이상만 지원")
        }
        present(filterVC, animated: true, completion: nil)
    }
    
    //지역 필터 버튼이 눌렸을때 동작
    @objc func locationBtnTapped(_ sender: UIButton){
        //선택 -> 선택 해제
        if selectedFilters.contains(sender.titleLabel!.text!){
            selectedFilters.remove(sender.titleLabel!.text!)
            sender.layer.borderColor = UIColor(named: "G4")!.cgColor
        }
        //선택 해제 -> 선택
        else{
            selectedFilters.insert(sender.titleLabel!.text!)
            sender.layer.borderColor = UIColor(named: "White")!.cgColor
        }
        updateFilterBtnState()
    }
    
    
    @IBAction func curLocationBtnTapped(_ sender: Any) {
        print("현위치 버튼 눌림")
        let tempLocation = CLLocationCoordinate2D(latitude: 37.546912668813, longitude: 127.0411420343)
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: tempLocation, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}

// MARK: - mapkit 관련 delegate
extension SearchViewController: MKMapViewDelegate, CLLocationManagerDelegate{
    func setUpMap(){
        mapView.delegate = self
        locationManager.delegate = self
        //지도 정확도 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //위치 데이터 승인 요구
        locationManager.requestWhenInUseAuthorization()
        
        /* 시뮬레이터에서는 현위치 정보 사용 불가 하므로, 임시 위치를 설정할 것임
         //위치 업데이트 시작
         locationManager.startUpdatingLocation()
         //사용자 위치 보기 설정
         mapView.showsUserLocation = true
         */
        
        //시뮬레이터는 현위치 인식 불가. 임시 위치 설정
        let tempLocation = CLLocationCoordinate2D(latitude: 37.546912668813, longitude: 127.0411420343)
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: tempLocation, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        //지도에 (임시) 내위치를 찍음
        let myAnnotaion = MKPointAnnotation()
        myAnnotaion.coordinate = tempLocation
        mapView.addAnnotation(myAnnotaion)
        
        //(더미) 가게들을 지도에 표시함
        for store in DummyStore.storeLocation{
            let storeAnnotation = MKPointAnnotation()
            storeAnnotation.coordinate = store.coordinate
            storeAnnotation.title = store.name
            mapView.addAnnotation(storeAnnotation)
        }
        
        //처음 지도 시작 위치를 (임시) 내위치로 설정함
        mapView.setRegion(coordinateRegion, animated: true)
        //다크 모드 설정
        mapView.overrideUserInterfaceStyle = .dark
        //        mapView.userTrackingMode = .follow
        
    }
    
    //위치 권한 상태가 변경될때 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    //사용자의 현위치 정보가 업데이트 될때 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //locations: 업데이트 된 위치 정보 배열
        if let location = locations.last { //위치 정보 배열에서 최근 위치
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) //위치 정보(위도, 경도)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)) //지도가 표시되는 범위 설정. 소수점이 작을 수록 확대됨
            mapView.setRegion(region, animated: true)
            
            locationManager.stopUpdatingLocation()
        }
    }
    
    // MARK: - 지도에 가게 annotation 추가
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKPointAnnotation {
            let identifier = "CustomAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil{
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                //annotation tap 시 detail 표시 안함(바로 화면 전환)
                annotationView?.canShowCallout = false
            }
            else{
                annotationView?.annotation = annotation
            }
            
            let store = DummyStore.storeLocation.first{ $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude }
            if let store = store {
                // 가게 종류에 따라 이미지 설정
                annotationView?.image = UIImage(named: "\(store.sort)Icon.png")
            }
            
            // Annotation 밑에 가게 이름을 표시하기 위해 UILabel 추가
            let nameLabel = UILabel()
            nameLabel.text = store?.name
            nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium) // 글자 크기 및 스타일 설정
            nameLabel.textColor = .white // 글자 색 설정
            nameLabel.backgroundColor = UIColor(named: "G4") // 배경색 설정
            nameLabel.layer.borderWidth = 0.8
            nameLabel.layer.borderColor = UIColor(named: "DarkGray")?.cgColor
            
            // nameLabel을 AnnotationView의 밑에 배치
            annotationView?.addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                nameLabel.centerXAnchor.constraint(equalTo: annotationView!.centerXAnchor),
                nameLabel.topAnchor.constraint(equalTo: annotationView!.bottomAnchor, constant: 5)
            ])
            
            return annotationView
        }
        return nil
    }
    
    // MARK: - annotation을 tap 했을 경우
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MKPointAnnotation {
            // 어노테이션을 탭한 경우, 해당 어노테이션의 정보를 이용하여 화면 전환
            if annotation.title == "My Location" {
                
            }
            else {
                //                let storeVC = self.storyboard?.instantiateViewController(identifier: "StoreInfoVC") as! StoreInfoViewController
                
                let storeVC = self.storyboard?.instantiateViewController(identifier: "StoreInfoVC") as! StoreInfoViewController
                storeVC.modalPresentationStyle = .pageSheet
                
                if #available(iOS 15.0, *) {
                    if let sheet = storeVC.sheetPresentationController {
                        sheet.delegate = self
                        //지원할 크기 지정
                        sheet.detents = [.medium()]
                        //뒷 배경 흐리게 안함
                        sheet.largestUndimmedDetentIdentifier = .medium
                        //시트 상단에 그래버 표시
                        sheet.prefersGrabberVisible = true
                    }
                } else {
                    print("ios 15 이상만 지원")
                }
                present(storeVC, animated: true, completion: nil)
                
            }
        }
    }
}

// MARK: - half modal을 위한 extension
extension SearchViewController: UISheetPresentationControllerDelegate{
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}
