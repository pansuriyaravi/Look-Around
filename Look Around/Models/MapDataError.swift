//
//  MapDataError.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import CoreLocation

/// Errors resulting from `MapKit` functions.
enum MapDataError: LocalizedError {
    case sceneRequestError(String, String?, Error)
    
    var errorDescription: String? {
        switch self {
        case .sceneRequestError(let locationID, let locationName, let error):
            let location = locationName ?? "<Unknown Location Name>"
            return String(localized: "Look Around scene request failed for itemID \(locationID) (\(location): \(error.localizedDescription)")
        }
    }
}
