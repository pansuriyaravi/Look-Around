//
//  MKCoordinateRegion.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    static var `default`: MKCoordinateRegion {
        return MKCoordinateRegion(
            center: .sanFrancisco,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

extension MKCoordinateRegion: Equatable {
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        return lhs.center == rhs.center && lhs.span == rhs.span
    }
}
