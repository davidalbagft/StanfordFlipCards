//
//  EmojiMemoryGame.swift
//  Project1FlipCards
//
//  Created by Alba Domingo, David on 31/08/2020.
//  Copyright © 2020 Alba Domingo, David. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String>
    let theme: Theme
    let name: String
    
    init(as theme: Theme) {
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(with: theme)
        self.name = theme.name
    }
    
    private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let allEmojis = theme.emojis
        
        let random = Int.random(in: 2...allEmojis.count)
        
        var emojis: [String] = []
        for emoji in 0..<random {
            emojis.append(allEmojis[emoji])
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}

