//
//  Grid.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-05-27.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView

    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }

    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }

    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }

    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.findFirstIndex(matching: item)
        return self.viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index!))
    }
}

//struct GridView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        Grid(0..<9) { item in
//            Text("Item: \(item)")
//        }
//    }
//}
