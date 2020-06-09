//
//  Cardify.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-06-09.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool

    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 2

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.secondary)
            }
        }
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
