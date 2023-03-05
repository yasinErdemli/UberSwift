//
//  RideType.swift
//  UberSwift
//
//  Created by Yasin Erdemli on 5.03.2023.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case uberX
    case black
    case uberXL
    
    var id: Int { return rawValue}
    
    var description: String {
        switch self {
        case .uberX:
            return "UberX"
        case .black:
            return "UberBlack"
        case .uberXL:
            return "UberXL"
        }
    }
    
    var ImageName: String {
        switch self {
        case .uberX:
            return "uber-x"
        case .black:
            return "uber-black"
        case .uberXL:
            return "uber-x"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .uberX:
            return 5
        case .black:
            return 20
        case .uberXL:
            return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInKilometers = distanceInMeters / 1000
        
        switch self {
        case .uberX:
            return distanceInMeters * 1.3 + baseFare
        case .black:
            return distanceInMeters * 1.6 + baseFare
        case .uberXL:
            return distanceInMeters * 1.45 + baseFare
        }
    }
}
