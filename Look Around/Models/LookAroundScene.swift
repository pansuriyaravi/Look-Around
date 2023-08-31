//
//  LookAroundScene.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import MapKit

actor LookAroundScene {
    static let shared = LookAroundScene()
    
    /// Results of loading objects of type `MKLookAroundScene`.
    private var lookAroundScenes = MapDataResults<String, MKLookAroundScene?>()
    
    private init() {
        
    }
    
    /// Gets the `MKLookAroundScene` for a map item after loading it asynchronously if necessary.
    /// - parameter mapItemID: The item ID of the map item.
    /// - returns: The Look Around scene, or throws an error if loading failed.
    func lookAroundScene(mapItem: MKMapItem) async throws -> MKLookAroundScene? {
        let sceneResult: Result<MKLookAroundScene?, Error>
        
        // If the scene already loaded, get the stored result.
        if let result = await lookAroundScenes.availableResult(for: mapItem.id) {
            sceneResult = result
        }
        
        // Otherwise, start a loading `Task` if necessary, and wait for the result.
        else {
            sceneResult = await lookAroundScenes.result(for: mapItem.id) {
                
                let sceneRequest = MKLookAroundSceneRequest(mapItem: mapItem)
                do {
                    // If fetching the `MKLookAroundScene` returns `nil` without an `Error`,
                    // Look Around is unavailable for that location.
                    return try await sceneRequest.scene
                } catch {
                    throw MapDataError.sceneRequestError(mapItem.id, mapItem.placemark.title, error)
                }
            }
        }
        
        return try sceneResult.get()
    }
}
