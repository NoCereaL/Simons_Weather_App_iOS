//
//  LocationHandler.swift
//  Simon's Weather App
//
//  Created by Simon K Moyana on 13/06/2022.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, ObservableObject, CLLocationManagerDelegate{
    let handler = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    override init() {
        super.init()
        handler.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        handler.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error, Location Permission Denied", error)
        isLoading = false
    }
}


