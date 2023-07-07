//
//  Games.swift
//  Bored
//
//  Created by Timothy Park on 7/6/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Games: Hashable, Codable {
    var id: Int
    var name: String
    var size: Int
    var description: String
    
//    this is if i have images
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }


    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

