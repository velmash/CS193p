//
//  ContentView.swift
//  Memorize
//
//  Created by 윤형찬 on 7/10/24.
//

import SwiftUI

struct ContentView: View {
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
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
    //                .strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10, 2]))
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}



#Preview {
    ContentView()
}
