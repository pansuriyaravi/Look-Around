//
//  MapItem+ID.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import CryptoKit
import MapKit

extension MKMapItem {
    var id: String {
        let coordinates = String(describing: placemark.coordinate)
        let sha = SHA256.hash(string: coordinates)
        return sha
    }
}
