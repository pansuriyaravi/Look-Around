//
//  PreviewData.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import MapKit

class PreviewData {
    static let shared = PreviewData()

    let placemark = MKPlacemark(coordinate: .sanFrancisco)
    let place = MKMapItem(
        placemark: MKPlacemark(
            coordinate: .sanFrancisco
        )
    )
}

