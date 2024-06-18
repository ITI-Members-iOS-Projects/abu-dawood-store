//
//  LocationService.swift
//  Abu Dawood
//
//  Created by MESHO on 29/05/2024.
//

import Foundation
import CoreLocation


class LocationService: NSObject, CLLocationManagerDelegate {
    private var cancellables = Set<AnyCancellable>()
    private var locationManager = CLLocationManager()
    private var currentLocation: PassthroughSubject<CLLocationCoordinate2D, Never> = .init()
    
    var currentLocationPublisher: AnyPublisher<CLLocationCoordinate2D, Never> {
        return currentLocation.eraseToAnyPublisher()
    }
    
    func initializeLocationManager() {
        setUpLocationManager()
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            updateLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func updateLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationManager.startUpdatingLocation()
    }
    
    private func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter  = 50
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        locations
            .publisher
            .last()
            .map({$0.coordinate})
            .compactMap({$0})
            .subscribe(currentLocation)
            .store(in: &cancellables)
    }
    
    
}
