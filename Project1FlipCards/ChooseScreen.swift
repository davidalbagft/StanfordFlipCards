//
//  ChooseScreen.swift
//  Project1FlipCards
//
//  Created by Alba Domingo, David on 04/09/2020.
//  Copyright © 2020 Alba Domingo, David. All rights reserved.
//

import SwiftUI

struct ChooseScreen: View {
    var body: some View {
        NavigationView {
            Form {
                createSections()
            }
            .navigationBarTitle("Choose an option")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func createSections() -> some View {
        let themes = Theme.themes
        return List(themes, id: \.self) { theme in
            NavigationLink(destination: ContentView(viewModel: EmojiMemoryGame(as: theme))) {
                Text(theme.name)
            }
        }
    }
}
