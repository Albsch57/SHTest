//
//  Devices.swift
//  SmartHomeApp
//
//  Created by Alona on 30.07.2022.
//

import Foundation
import UIKit

// MARK: - Welcome
struct Welcome: Codable {
    let devices: [Device]
    let user: User
}

// MARK: - Device
struct Device: Codable, Hashable {
    let id: Int
    let deviceName: String
    let intensity: Int?
    let mode: String?
    let productType: ProductType
    let position, temperature: Int?
}

enum ProductType: String, Codable {
    case heater = "Heater"
    case light = "Light"
    case rollerShutter = "RollerShutter"
    
    var image: UIImage? {
        switch self {
        case .heater:
            return UIImage(named: "DeviceHeaterOnIcon")
        case .light:
            return UIImage(named: "DeviceLightOnIcon")
        case .rollerShutter:
            return UIImage(named: "DeviceRollerShutterIcon")
        }
    }
}
 

// MARK: - User
struct User: Codable {
    let firstName, lastName: String
    let address: Address
    let birthDate: Int
}

// MARK: - Address
struct Address: Codable {
    let city: String
    let postalCode: Int
    let street, streetCode, country: String
}

