//
//  GameCard.swift
//  Bored
//
//  Created by Timothy Park on 7/6/23.
//

import SwiftUI



struct GameCard: View {
    var game: Games
    
    var body: some View {
        HStack {
            Text(game.name)
        }
    }
}

struct GameCard_Previews: PreviewProvider {
    static var previews: some View {
        GameCard(game: game[0])
    }
}
