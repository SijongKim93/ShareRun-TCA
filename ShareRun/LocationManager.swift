//
//  LocationManager.swift
//  ShareRun
//
//  Created by 김시종 on 9/23/24.
//

import Combine
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private let subject = PassthroughSubject<CLLocation, Never>()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func startUpdatingLocation() -> AnyPublisher<CLLocation, Never> {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        return subject.eraseToAnyPublisher()
    }
    
    func stopUpdatingLocation() {
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            subject.send(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        <#code#>
    }
}
