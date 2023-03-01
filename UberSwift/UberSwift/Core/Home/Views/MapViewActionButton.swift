//
//  MapViewActionButton.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import SwiftUI

struct MapViewActionButton: View {
    var body: some View {
        Button {
            // yet to come
        } label: {
            Image(systemName: "line.3.horizontal")
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
        MapViewActionButton()
    }
}
