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
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
