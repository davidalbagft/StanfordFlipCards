//
//  Grid.swift
//  Project1FlipCards
//
//  Created by Alba Domingo, David on 02/09/2020.
//  Copyright © 2020 Alba Domingo, David. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(self.items) { item in
            self.body(for: item, with: layout)
        }
    }
    
    private func body(for item: Item, with layout: GridLayout) -> some View {
        let index = items.firstIndex(of: item)!
        return self.viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
}
