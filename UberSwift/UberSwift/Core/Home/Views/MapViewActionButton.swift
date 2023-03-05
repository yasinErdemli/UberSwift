//
//  MapViewActionButton.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    var body: some View {
        Button {
            withAnimation(.spring()) {
                if mapState == .noInput {
                    mapState = .searchingForLocation
                } else if mapState == .searchingForLocation {
                    mapState = .noInput
                } else {
                    mapState = .noInput
                }
            }
        } label: {
            Image(systemName: mapState == .searchingForLocation || mapState == .locationSelected ? "arrow.left" : "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
