//
//  SearchViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/11.
//

import UIKit
import MapKit
import CoreLocation

class SearchViewController: UIViewController, DataSendDelegate{
    
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
        //위치 업데이트 시작
        locationManager.startUpdatingLocation()
        //사용자 위치 보기 설정
        mapView.showsUserLocation = true
        //다크 모드 설정
        mapView.overrideUserInterfaceStyle = .dark
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
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
    
}

// MARK: - half modal을 위한 extension
extension SearchViewController: UISheetPresentationControllerDelegate{
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
            print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
        }
}
