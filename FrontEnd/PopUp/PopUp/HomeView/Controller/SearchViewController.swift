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
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpMap()
        
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
