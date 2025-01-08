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
        NavigationView {
            List(data.response.results, id: \.name) { pokemon in
                NavigationLink(destination: PokemonView(pokemonName: pokemon.name ?? "",photoURL: pokemonData[pokemon.name ?? ""]?.response.sprites.front_default)) {
                    if let fetchedData = pokemonData[pokemon.name ?? ""] {
                        if let imageURL = URL(string: fetchedData.response.sprites.front_default ?? "") {
                            AsyncImage(url: imageURL) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        VStack {
                            Text("\(pokemon.name ?? "")")
                                .font(Constants.textFont)
                            ForEach(fetchedData.response.types, id: \.slot) { type in
                                Text(type.type.name ?? "Unknown Type")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        
                        
                    } else {
                        Text("Loading details...")
                            .font(Constants.textFont)
                            .foregroundColor(.gray)
                            .onAppear {
                                Task {
                                    await fetchPokemonData(for: pokemon)
                                }
                            }
                    }
                    
                    
                    
                    
                }
            }
            .navigationTitle("Pokemon List")
            .onAppear {
                Task {
                    await fetchPokemonData()
                }
            }
        }
    }

    private func fetchPokemonData() async {
        await data.getData()
    }
    private func fetchPokemonData(for pokemon: Pokemon) async {
        guard let pokemonName = pokemon.name, let pokemonURL = pokemon.url else { return }

        if pokemonData[pokemonName] != nil { return }
        
        var fetcher = FetchPokemonData(PokemonURL: pokemonURL)
        await fetcher.getData()

        DispatchQueue.main.async {
            pokemonData[pokemonName] = fetcher
        }
    }

}


#Preview {
    PokemonListView()
}
