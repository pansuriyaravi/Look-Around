//
//  ContentView.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var mapVM = MapViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            MapControllerRepresentable(
                annotation: mapVM.annotation,
                delegate: mapVM
            )
            .edgesIgnoringSafeArea(.all)
            
            if let annotation = mapVM.annotation {
                LookAroundView(place: annotation)
                    .frame(width: 200, height: 128)
                    .cornerRadius(8)
                    .padding()
                    .overlay {
                        if mapVM.isLoading {
                            ProgressView()
                        }
                    }
                    .disabled(mapVM.isLoading)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
