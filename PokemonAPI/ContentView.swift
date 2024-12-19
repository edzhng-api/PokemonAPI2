//
//  ContentView.swift
//  PokemonAPI
//
//  Created by Edison Zheng (student LM) on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("pikachu 1")
                    .resizable()
                    .ignoresSafeArea()
            }
            VStack {
                Spacer()
                Button(action: {
                    
                }
                       , label: {
                    Text("Press Start")
                        .padding(10)
                        .font(.largeTitle)
                        .foregroundStyle(Color.black)
                        .background(Color.white)
                        .opacity(0.8)
                        .cornerRadius(10)
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
