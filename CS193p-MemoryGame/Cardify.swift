//
//  Cardify.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-06-09.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier, AnimatableModifier {
    var rotation: Double

    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }

    var isFaceUp: Bool {
        rotation < 90
    }

    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }

    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 2

    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)

            RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.secondary)
                .opacity(isFaceUp ? 0 : 1)

        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
