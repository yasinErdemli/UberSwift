//
//  HomeVİew.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState: MapViewState = .noInput
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState )
                } else if mapState == .noInput {
                    LocationSearchActivatitonView()
                        .padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 4)
            }
            if mapState == .locationSelected {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
            .onReceive(LocationManager.shared.$userLocation) { location in
                if let location = location {
                    print("Location in main menu \(location)")
                }
                
            }
    }
}

struct HomeVI_ew_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
