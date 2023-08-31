//
//  MKMapItem+mkPointAnnotation.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import MapKit

extension MKMapItem {
    var mkPointAnnotation: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = name ?? ""

        return annotation
    }
}
