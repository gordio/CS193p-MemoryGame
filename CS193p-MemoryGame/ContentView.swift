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
            HStack {
                Text("Score: \(gameViewModel.score)")
                Button (action: {self.gameViewModel.restart()}) {
                    Text("Restart").disabled(gameViewModel.inRestart)
                }
            }.padding(.top)
            if gameViewModel.gameOver {
                VStack {
                    Text("Game over").font(.title).padding()
                    Button (action: {self.gameViewModel.restart()}) {
                        Text("New game")
                    }
                }
            } else {
                Grid(gameViewModel.cards) {card in
                    CardView(card: card).onTapGesture {
                        self.gameViewModel.choose(card: card)
                    }.padding(5)
                }
                .padding(10)
                .foregroundColor(.secondary)
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card


    let iconFontScaleFactor: CGFloat = 0.66

    var body: some View {
        GeometryReader(content: {geometry in
            self.body(for: geometry.size)
        })
    }

    @ViewBuilder
    func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(
                    startAngle: Angle.degrees(0-90),
                    endAngle: Angle.degrees(0.001-90),
                    clockwise: true
                )
                    .padding(4)
                    .opacity(0.4)
                Text(card.content)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .font(Font.system(size: min(size.width, size.height) * iconFontScaleFactor))
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameViewModel: EmojiMemoryGame())
    }
}
