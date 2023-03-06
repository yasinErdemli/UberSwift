//
//  LocationSearchViewModel.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import Foundation
import MapKit


class LocationSearchViewModel: NSObject, ObservableObject {
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocation: CLLocationCoordinate2D?
    @Published var distance: Double?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    func selectLocation(_ location: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: location) { response, error in
            self.distance = nil
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            
            self.selectedLocation = coordinate
            self.getDistance()
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping(MKLocalSearch.CompletionHandler)) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)

        search.start(completionHandler: completion)
    }
    
    
    func getDistance() {
        guard let userLocation = userLocation else { return }
        guard let selectedLocation = selectedLocation else { return }
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destinationPlacemark = MKPlacemark(coordinate: selectedLocation)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let route = response?.routes.first else { return }
            self.distance = route.distance
            print(route.distance)
        }
    }
    
    func computeRidePrice(for type: RideType) -> Double {
        guard let routeDistance = self.distance else { return 0}
        return type.computePrice(for: routeDistance)
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
