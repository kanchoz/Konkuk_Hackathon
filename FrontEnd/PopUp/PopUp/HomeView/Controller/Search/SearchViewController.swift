//
//  SearchViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/11.
//

import UIKit
import MapKit
import CoreLocation

class SearchViewController: UIViewController{
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var searchBarBtn: UIButton!
    @IBOutlet var filterBtn: UIButton!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpMap()
    }
    
    func setUpUI(){
        filterBtn.addTarget(self, action: #selector(filterBtnTapped), for: .touchUpInside)
        
    }
    
    //검색 바 tap
    @IBAction func searchBarBtnTapped(_ sender: Any) {
        let searchDetailVC = self.storyboard?.instantiateViewController(identifier: "searchDetailVC") as! SearchDetailViewController
        
        searchDetailVC.modalPresentationStyle = .fullScreen
        self.present(searchDetailVC, animated: true, completion: nil)
        
    }
    
    //필터 버튼 tap
    @objc private func filterBtnTapped() {
        let filterVC = self.storyboard?.instantiateViewController(identifier: "filterVC") as! FilterViewController
        
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
