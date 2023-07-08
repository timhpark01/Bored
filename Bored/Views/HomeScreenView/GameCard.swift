//
//  GameCard.swift
//  Bored
//
//  Created by Timothy Park on 7/6/23.
//

import SwiftUI



struct GameCard: View {
    var exampleGame: Games
    
    var body: some View {
        HStack {
            HStack {
                Text(exampleGame.name)
            }
            HStack {
                Text(String(exampleGame.id))
            }
            HStack {
                Text(String(exampleGame.size))
            }
            HStack {
                Text(exampleGame.description)
            }
        }
    }
}

struct GameCard_Previews: PreviewProvider {
    static var previews: some View {
//        GameCard(game: game[0])
        let ExampleGame = Games(id:3, name:"hi", size:5, description: "this is a game")
        GameCard(exampleGame: ExampleGame)
    }
}
