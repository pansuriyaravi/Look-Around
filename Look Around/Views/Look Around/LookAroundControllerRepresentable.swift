//
//  LookAroundControllerRepresentable.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import SwiftUI
import MapKit

struct LookAroundControllerRepresentable: UIViewControllerRepresentable {
    let scene: MKLookAroundScene?
    
    typealias UIViewControllerType = MKLookAroundViewController
    
    func makeUIViewController(context: Context) -> MKLookAroundViewController {
        let controller = MKLookAroundViewController()
        controller.scene = scene
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MKLookAroundViewController, context: Context) {
        uiViewController.scene = scene
    }
}

struct LookAroundControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        LookAroundControllerRepresentable(scene: nil)
    }
}
