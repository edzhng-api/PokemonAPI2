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
    let homePhotoURL: String?
    let types: [String]
    let abilities: [String]
    let height: Int
    let weight: Int

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.background)
                .ignoresSafeArea()
            Rectangle()
                .frame(width: 350)
                .cornerRadius(20)
                .opacity(0.5)
            VStack {
                if let url = homePhotoURL ?? photoURL, let imageURL = URL(string: url) {
                    HStack {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                } else {
                    Text("No image available")
                        .font(Constants.textFont)
                        .foregroundColor(.gray)
                }
                
                Text(pokemonName.capitalized)
                    .foregroundColor(.white)
                    .font(Constants.textFont)
                    .padding()
                
                HStack {
                    Text("Height: \(height)")
                        .foregroundColor(.white)
                        .font(Constants.captionFont)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                
                HStack {
                    Text("Weight: \(weight)")
                        .foregroundColor(.white)
                        .font(Constants.captionFont)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                
                HStack {
                    Text("Types: \(types.joined(separator: ", "))")
                        .foregroundColor(.white)
                        .font(Constants.captionFont)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                
                HStack {
                    Text("Abilities: \(abilities.joined(separator: ", "))")
                        .foregroundColor(.white)
                        .font(Constants.captionFont)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                
                Spacer()
            }
            .navigationTitle(pokemonName.capitalized)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PokemonView(
        pokemonName: "Pikachu",
        photoURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
        homePhotoURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/25.png",
        types: ["Electric"],
        abilities: ["Static", "Lightning Rod"],
        height: 3,
        weight: 5
    )
}
