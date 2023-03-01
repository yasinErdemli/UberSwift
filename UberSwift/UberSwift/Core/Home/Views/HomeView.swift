//
//  HomeVİew.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            LocationSearchActivatitonView()
                .frame(width: .infinity, height: 60, alignment: .center)
                .padding(.top, 72)
            MapViewActionButton()
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

struct HomeVI_ew_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
