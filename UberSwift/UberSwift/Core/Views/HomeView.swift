//
//  HomeVİew.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeVI_ew_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
