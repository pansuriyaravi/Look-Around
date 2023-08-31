//
//  MapViewController.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import SwiftUI
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    var region: MKCoordinateRegion = MKCoordinateRegion(center: .sanFrancisco, span: .default)
    var annotation: MKMapItem? = nil
    var delegate: MapViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMapView()
        setRegion(region: region, animated: false)
        add(annotation: annotation)
    }
}

extension MapViewController {
    private func configureMapView() {
        mapView = MKMapView()
        
        // Add tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(recognizer:)))
        mapView.addGestureRecognizer(tapGesture)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        // Set up constraints for the map view to cover the whole view
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    func setRegion(region: MKCoordinateRegion, animated: Bool) {
        mapView.setRegion(region, animated: animated)
    }
    
    func setCenter(center: CLLocationCoordinate2D, span: MKCoordinateSpan? = nil, animated: Bool) {
        var region = mapView.region
        region.center = center
        if let span = span {
            region.span = span
        }
        setRegion(region: region, animated: animated)
    }
    
    func add(annotation: MKMapItem?) {
        let currentAnnotation = mapView.annotations.first
        guard let annotation = annotation?.mkPointAnnotation,
              currentAnnotation?.coordinate != annotation.coordinate
        else {
            mapView.removeAnnotations(mapView.annotations)
            return
        }
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
        setCenter(center: annotation.coordinate, animated: true)
    }
}

extension MapViewController {
    // Handle tap gestures on the map
    @objc func handleTapGesture(recognizer: UITapGestureRecognizer) {
        let touch = recognizer.location(in: mapView)
        let coordinates = mapView.convert(touch, toCoordinateFrom: mapView)
        
        delegate?.onTap(coordinates: coordinates)
    }
}

