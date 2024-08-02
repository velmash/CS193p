//
//  ContentView.swift
//  Memorize
//
//  Created by 윤형찬 on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "😈"]
    
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
        
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
    //                .strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10, 2]))
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture(count: 2) {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
