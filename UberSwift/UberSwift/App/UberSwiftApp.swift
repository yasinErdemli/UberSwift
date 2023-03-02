//
//  UberSwiftApp.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 1.03.2023.
//

import SwiftUI

@main
struct UberSwiftApp: App {
    @StateObject var viewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
