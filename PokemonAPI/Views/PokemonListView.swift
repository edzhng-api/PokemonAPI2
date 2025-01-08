//
//  PokemonListView.swift
//  PokemonAPI
//
//  Created by Sebastian Steed (student LM) on 1/2/25.
//

import SwiftUI

struct PokemonListView: View {
    @State var data = FetchData()
    @State var pokemonData: [String: FetchPokemonData] = [:]
    
    var body: some View {
        ScrollView{
            ForEach(data.response.results){ pokemon in
                VStack{
                    Text(pokemon.name ?? " ")
                        .font(Constants.textFont)
                    
                    if let pokemonData = pokemonData[pokemon.name ?? ""]{
                        Text("Weight: \(pokemonData.response.weight)")
                            .font(Constants.textFont)
                    } else {
                        Text("Loading...")
                            .onAppear {
                                Task {
                                    await fetchPokemonData(for: pokemon)
                                }
                            }
                    }
                }
                    
            }
        }.onAppear {
            Task {
                await fetchPokemonData()
            }
        }
    }
    private func fetchPokemonData() async {
        await data.getData()
    }
    
    private func fetchPokemonData(for pokemon: Pokemon) async {
        if let pokemonURL = pokemon.url {
            var fetcher = FetchPokemonData(PokemonURL: pokemonURL)
            await fetcher.getData()
            
            pokemonData[pokemon.name ?? ""] = fetcher
        }
    }
}

#Preview {
    PokemonListView()
}
