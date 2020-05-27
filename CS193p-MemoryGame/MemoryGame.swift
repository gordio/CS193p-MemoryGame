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

    mutating func choose(card: Card) {
        print("Choose card: \(card)")
        let choosenIndex = self.index(of: card)
        self.cards[choosenIndex].isFaceUp = !self.cards[choosenIndex].isFaceUp
    }

    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1 // TODO: Raise error
    }

    init(numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfCards {
            let content =  cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    struct Card: Identifiable {
        var id: Int

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
