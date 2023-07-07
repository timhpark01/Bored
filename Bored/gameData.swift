//
//  list.swift
//  Bored
//
//  Created by Timothy Park on 2/28/23.
//

import Foundation

struct Game: Hashable, Codable {
    var id: Int
    var name: String
    var game: String
    var description: String
    
    // reads in teh the image name and adds it
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}


