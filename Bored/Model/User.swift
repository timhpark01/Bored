//
//  User.swift
//  Bored
//
//  Created by Timothy Park on 7/13/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var username: String
    var userUID: String
    var userGame: String
    var gamerTag: String
    var userEmail: String
    var userPhone: String
    var userProfileURL: URL
    
    enum CodingKeys: CodingKey {
        case id
        case username
        case userUID
        case userGame
        case gamerTag
        case userEmail
        case userPhone
        case userProfileURL
    }
}
