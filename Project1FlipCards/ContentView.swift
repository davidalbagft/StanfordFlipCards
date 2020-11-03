//
//  ContentView.swift
//  Project1FlipCards
//
//  Created by Alba Domingo, David on 26/08/2020.
//  Copyright © 2020 Alba Domingo, David. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var animationDuration = 0.70
    @ObservedObject var viewModel: EmojiMemoryGame
    
    init(viewModel: EmojiMemoryGame) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Grid (items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: animationDuration)) {
                        self.viewModel.choose(card: card)
                    }
                }
                    .padding(5)
            }
                .navigationBarTitle(viewModel.name)
                .padding(10)
            .foregroundColor(viewModel.theme.color)
            Button {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
            } label: { Text("New Game") }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    private let scaleFactor: CGFloat = 0.7
    
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    @ViewBuilder
    func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(-animatedBonusRemaining * 360 - 90), clockwise: true)
                            .onAppear {
                                startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(-card.bonusRemaining * 360 - 90), clockwise: true)
                            
                    }
                }
                    .padding(5)
                    .opacity(0.35)
                    .transition(.identity)
                
                Text(self.card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * scaleFactor
    }
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
}
