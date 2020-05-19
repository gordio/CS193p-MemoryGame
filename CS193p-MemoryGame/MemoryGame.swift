//
//  MemoryGame.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-05-18.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>

    func choose(card: Card) {
        print("Choose card: \(card)")
    }

    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfCards {
            let content =  cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, isFaceUp: false, isMatched: false, content: content))
        }
    }

    struct Card: Identifiable {
        var id: Int

        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
