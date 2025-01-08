//
//  PokemonView.swift
//  PokemonAPI
//
//  Created by Filip Cyran (student LM) on 1/7/25.
//

import SwiftUI

struct PokemonView: View {
    let pokemonName: String
    let photoURL: String?

    var body: some View {
        VStack {
            if let url = photoURL, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Text("No image available")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text(pokemonName.capitalized)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle(pokemonName.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    PokemonView(pokemonName: "Pikachu", photoURL: "")
}
