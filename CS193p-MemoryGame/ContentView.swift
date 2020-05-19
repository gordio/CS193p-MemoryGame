//
//  ContentView.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-05-18.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2.0)
                Text(card.content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.secondary)
            }
        }
    }
}

struct ContentView: View {
    var gameViewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            ForEach(gameViewModel.cards) {card in
                CardView(card: card).onTapGesture {
                    self.gameViewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameViewModel: EmojiMemoryGame())
    }
}
