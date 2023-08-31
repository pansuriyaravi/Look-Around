//
//  MapControllerRepresentable.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import SwiftUI
import MapKit

struct MapControllerRepresentable: UIViewControllerRepresentable {
    let annotation: MKMapItem?
    var delegate: MapViewControllerDelegate? = nil
    
    typealias UIViewControllerType = MapViewController
    
    func makeUIViewController(context: Context) -> MapViewController {
        let controller = MapViewController()
        controller.delegate = delegate
        controller.annotation = annotation
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        uiViewController.add(annotation: annotation)
    }
}

struct MapControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        MapControllerRepresentable(
            annotation: dev.place
        )
        .edgesIgnoringSafeArea(.all)
    }
}
