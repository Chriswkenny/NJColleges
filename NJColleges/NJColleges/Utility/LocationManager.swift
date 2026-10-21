//
//  LocationManager.swift
//  NJColleges
//
//  Created by Christopher W. Kenny on 10/21/26.
//

import Foundation
import CoreLocation

@Observable
final class LocationManager: NSObject{
    
    var authorizationStatus: CLAuthorizationStatus
    var location: CLLocation?
    
    private let manager = CLLocationManager()
    
    override init(){
        authorizationStatus = manager.authorizationStatus
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        requestLocationPermission()
    }
    
    func requestLocationPermission(){
        manager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation(){
        guard authorizationStatus == .authorizedWhenInUse ||
                authorizationStatus == .authorizedAlways
            else{
                return
        }
        manager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation(){
        manager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        authorizationStatus = manager.authorizationStatus
        
        switch manager.authorizationStatus{
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        
        case .denied, .restricted:
            manager.stopUpdatingLocation()
        
        case .notDetermined:
            break
        
        @unknown default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        location = locations.last
    }
}
