//
//  EmojiMemoryGame.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-05-18.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import Foundation


let emoji = ["🥶", "😎", "🤬", "👻", "😈", "🤢"].shuffled()


class EmojiMemoryGame {
    private var model = MemoryGame<String>(numberOfCards: emoji.count) {index in emoji[index]}

    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
