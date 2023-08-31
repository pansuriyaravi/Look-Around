//
//  MKCoordinateSpan.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import MapKit

extension MKCoordinateSpan: Equatable {
    public static func == (lhs: MKCoordinateSpan, rhs: MKCoordinateSpan) -> Bool {
        return lhs.latitudeDelta == rhs.latitudeDelta && lhs.longitudeDelta == rhs.longitudeDelta
    }
}

extension MKCoordinateSpan {
    static var `default`: MKCoordinateSpan {
        return MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    }
}
