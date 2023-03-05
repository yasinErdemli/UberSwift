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
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            
            self.selectedLocation = coordinate
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping(MKLocalSearch.CompletionHandler)) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)

        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(for type: RideType) -> Double {
        guard let coordinate = selectedLocation else { return 0 }
        guard let userLocation = self.userLocation else { return 0 }
        //guard let routeDistance = self.distance else { return 0}
        
        let selectedLocationCLLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let userLocationCLLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let distance = selectedLocationCLLocation.distance(from: userLocationCLLocation)
        
        return type.computePrice(for: distance)
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
