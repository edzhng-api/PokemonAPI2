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
                        .foregroundStyle(Color.black)
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
