//
//  OrderType.swift
//  LearnWidgetShared
//
//  Created by Indra Tirta Nugraha on 18/08/22.
//

import Foundation

public enum OrderType: String {
    case flight = "FLIGHT"
    case train = "TRAIN"
    case carRental = "CAR_RENTAL"
    
    public var iconSystemName: String {
        switch self {
        case .flight:
            return "airplane.circle.fill"
        case .train:
            return "tram.circle.fill"
        case .carRental:
            return "car.circle.fill"
        }
    }
    
    public var name: String {
        switch self {
        case .flight:
            return "Flight"
        case .train:
            return "Train"
        case .carRental:
            return "Car Rental"
        }
    }
}
