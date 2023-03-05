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
            return 7
        case .black:
            return 13
        case .uberXL:
            return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInKilometers = distanceInMeters / 1000
        
        switch self {
        case .uberX:
            return ((distanceInKilometers * 7 + baseFare) * 100).rounded() / 100
        case .black:
            return ((distanceInKilometers * 19.5 + baseFare) * 100).rounded() / 100
        case .uberXL:
            return ((distanceInKilometers * 13.25 + baseFare) * 100).rounded() / 100
        }
    }
}
