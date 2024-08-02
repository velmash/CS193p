//
//  ContentView.swift
//  Memorize
//
//  Created by 윤형찬 on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        /*
         VStack(alignment: .leading, spacing: 20) { //@ViewBuilder
         Image(systemName: "globe")
         //                .imageScale(.small) //ViewModifier
         .foregroundColor(.green) //ViewModifier
         Text("Hello, CS139p").padding()
         }
         .font(.largeTitle)
         .foregroundColor(.orange)
         .imageScale(.large) //내부에 텍스트는 이미지가 아니기 때문에 무시
         */
        
        VStack(spacing: 5) {
            ScrollView {
                cards
            }
            
            Spacer()
            cardCountAdjusters
        }
        
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)), GridItem(), GridItem()]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            
            Spacer()
            
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
    //                .strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10, 2]))
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture(count: 2) {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
