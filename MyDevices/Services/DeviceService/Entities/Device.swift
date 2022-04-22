//
//  Device.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation

struct Device: Codable, Identifiable {
    let id: String
    var isFavorite: Bool
    let imageURL: String
    let brand: String
    let model: String
    let os: String
    let screenResolution: String
    let stars: Double
    let status: Status
    
    enum Status: String, Codable {
        case available
        case unavailabe
    }
}
