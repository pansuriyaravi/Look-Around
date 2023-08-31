//
//  CLLocationCoordinate2D.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

extension CLLocationCoordinate2D {
    static var sanFrancisco: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417)
    }
    
    var clLocation: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
