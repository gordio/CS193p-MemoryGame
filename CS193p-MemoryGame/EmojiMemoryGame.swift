//
//  EmojiMemoryGame.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-05-18.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import Foundation


let emoji = ["🥶", "😎", "🤬", "👻", "😈", "🤢", "😳", "😑", "😹"].shuffled()

let themes = [
    ["👻", "💀", "☠️", "🦷", "🦵🏻", "🎃"],
    ["😓", "🤗", "🤔", "🙄", "😧", "🥱"],
    ["🤝", "👍", "✌️", "🤘", "🖐", "☝️"],
    ["🐙", "🦞", "🦑", "🐟", "🐡", "🐠"],
    ["🍒", "🥑", "🥦", "🥒", "🥕", "🌶"]
]


class EmojiMemoryGame: ObservableObject {
    @Published
    private var model: MemoryGame<String>?
    @Published
    private(set) var score = 0
    private(set) var inRestart = false
    private let restartDelay = 1.2

    var gameOver: Bool {
        get {
            score <= 0
        }
    }

    init() {
        self.restart()
    }

    func restart() {
        if inRestart {
            return
        }
        inRestart = true
        score = 10
        let randomTheme = Int.random(in: 0..<themes.count)
        let choosenTheme = themes[randomTheme].shuffled()
        model = MemoryGame<String>(numberOfCards: choosenTheme.count, cardContentFactory: {choosenTheme[$0]})

        // FIXME: Remove old clojure on restart
        cards.indices.forEach { self.model!.cards[$0].isFaceUp = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + restartDelay) {
            self.cards.indices.forEach { self.model!.cards[$0].isFaceUp = false }
            self.inRestart = false
        }
    }

    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model!.cards
    }

    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        score -= 1
        let isMatched = model!.choose(card: card)
        if isMatched {
            score += 5
        }
    }
}
