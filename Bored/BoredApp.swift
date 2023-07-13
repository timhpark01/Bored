//
//  BoredApp.swift
//  Bored
//
//  Created by Timothy Park on 2/28/23.
//

import SwiftUI
import Firebase

@main
struct BoredApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
