//
//  PokemonListView.swift
//  PokemonAPI
//
//  Created by Sebastian Steed (student LM) on 1/2/25.
//

import SwiftUI

struct PokemonListView: View {
    @State var data = FetchData()
    var body: some View {
        ScrollView{
            ForEach(data.response.results){ pokemon in
                VStack{
                    Text(pokemon.name ?? " ")
                }
                    
            }
        }
    }
}

#Preview {
    PokemonListView()
}
