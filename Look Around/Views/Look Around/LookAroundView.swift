//
//  LookAroundView.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import SwiftUI
import MapKit
import os.log

private let logger = Logger(category: "Look Around")

struct LookAroundView: View {
    let place: MKMapItem
    
    @State private var scene: MKLookAroundScene? = nil
    @State private var isLoading: Bool = false
    
    private var isAvailable: Bool {
        return scene != nil
    }
    
    var body: some View {
        ZStack {
            LookAroundControllerRepresentable(scene: scene)
            
            if !isAvailable {
                Text("Not Available")
                    .font(.body.weight(.medium))
                    .kerning(0.6)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
            }
            
            if isLoading {
                ProgressView()
            }
        }
        .disabled(!isAvailable)
        .disabled(isLoading)
        .task(id: place.id, fetchScene)
    }
    
    @Sendable
    func fetchScene() async {
        await MainActor.run {
            isLoading = true
        }
        
        do {
            let scene = try await LookAroundScene.shared.lookAroundScene(mapItem: place)
            await MainActor.run {
                self.scene = scene
                isLoading = false
            }
        } catch {
            await MainActor.run {
                isLoading = false
            }
            logger.error("Scene fatching error: \(error)")
        }
    }
}

struct LookAroundView_Previews: PreviewProvider {
    static var previews: some View {
        LookAroundView(place: dev.place)
    }
}
