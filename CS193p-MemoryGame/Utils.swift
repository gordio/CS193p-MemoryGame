//
//  Utils.swift
//  CS193p-MemoryGame
//
//  Created by Oleh Hordiienko on 2020-05-27.
//  Copyright © 2020 R-Activity. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable {
    func findFirstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    var onlyOne: Element? {
        count == 1 ? first : nil
    }
}
