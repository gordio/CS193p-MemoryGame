//
//  ContentView.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-05-18.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame

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

struct CardView: View {
    var card: MemoryGame<String>.Card

    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 2
    let iconFontScaleFactor: CGFloat = 0.6

    var body: some View {
        GeometryReader(content: {geometry in
            self.body(for: geometry.size)
        })
    }

    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.secondary)
            }
        }
        .font(Font.system(size: min(size.width, size.height) * iconFontScaleFactor))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameViewModel: EmojiMemoryGame())
    }
}
