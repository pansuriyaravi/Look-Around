//
//  MapViewControllerDelegate.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import MapKit

protocol MapViewControllerDelegate {
    func onTap(coordinates: CLLocationCoordinate2D)
}
