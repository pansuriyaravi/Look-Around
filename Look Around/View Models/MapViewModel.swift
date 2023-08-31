//
//  MapViewModel.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import MapKit
import os.log

private let logger = Logger(category: "Map ViewModel")

class MapViewModel: ObservableObject {
    @Published private(set) var annotation: MKMapItem? = nil
    @Published var isLoading: Bool = false
    
    init() {
        Task {
            try await Task.sleep(nanoseconds: UInt64(1e9))
            await getMapItem(for: CLLocationCoordinate2D.sanFrancisco)
        }
    }
    
    private func getMapItem(for coordinate: CLLocationCoordinate2D) async {
        await MainActor.run {
            isLoading = true
        }
        
        do {
            let placemark = try await CLGeocoder.reverseGeocodeLocation(coordinate: coordinate)
            let mkPlacemark = MKPlacemark(placemark: placemark)
            let mapItem = MKMapItem(placemark: mkPlacemark)
            
            logger.debug("Map item retrieved for coordinate: \(String(describing: coordinate))")

            await MainActor.run {
                annotation = mapItem
                isLoading = false
            }
        } catch  {
            logger.error("Error while retrieving map item: \(error)")
            
            await MainActor.run {
                isLoading = false
            }
        }
    }
}

extension MapViewModel: MapViewControllerDelegate {
    func onTap(coordinates: CLLocationCoordinate2D) {
        Task {
           await getMapItem(for: coordinates)
        }
    }
}


extension CLGeocoder {
    static func reverseGeocodeLocation(coordinate: CLLocationCoordinate2D) async throws -> CLPlacemark{
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let geocoder = CLGeocoder()
        
        let placemarks = try await geocoder.reverseGeocodeLocation(location)
        guard let placemark = placemarks.first else {
            throw CLError(.geocodeFoundNoResult)
        }
        
        return placemark
    }
}
