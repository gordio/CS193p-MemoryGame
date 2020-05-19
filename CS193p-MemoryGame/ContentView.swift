//
//  ContentView.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-05-18.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import SwiftUI


struct CardView: View {
    var isFaceUp = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2.0)
                Text("🥶").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.secondary)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<4) {_ in
                CardView(isFaceUp: true)
            }
        }
        .padding()
        .foregroundColor(.secondary)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
