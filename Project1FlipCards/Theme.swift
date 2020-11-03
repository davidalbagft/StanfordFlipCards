//
//  Theme.swift
//  Project1FlipCards
//
//  Created by Alba Domingo, David on 04/09/2020.
//  Copyright © 2020 Alba Domingo, David. All rights reserved.
//

import SwiftUI

enum Theme {
    case halloween
    case animal
    case food
    
    static var themes: [Theme] {
        [.halloween, .animal, .food]
    }
    
    var emojis: [String] {
        switch self {
        case .halloween:
            return ["👻", "🎃", "🕷", "🧙‍♀️" , "🧟‍♂️"]
        case .animal:
            return ["🐲", "🐶", "🐹", "🐍", "🐷", "🦉"]
        case .food:
            return ["🍕", "🍔", "🍛", "🍱", "🥞", "🍧", "🍜"]
        }
    }
    
    var name: String {
        switch self {
        case .halloween:
            return "Halloween"
        case .animal:
            return "Animal"
        case .food:
            return "Food"
        }
    }
    
    var color: Color {
        switch self {
        case .halloween:
            return .orange
        case .animal:
            return .red
        case .food:
            return .gray
        }
    }
}
