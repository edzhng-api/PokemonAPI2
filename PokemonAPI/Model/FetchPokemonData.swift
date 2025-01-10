//
//  FetchPokemonData.swift
//  PokemonAPI
//
//  Created by Sebastian Steed (student LM) on 1/7/25.
//

import Foundation

struct FetchPokemonData {
    var PokemonURL: String
    var response: PokemonResponse = PokemonResponse()
    
    mutating func getData() async {
        let URLString = PokemonURL
        
        guard let url = URL(string: URLString) else { return }
        guard let (data, _) = try? await URLSession.shared.data(from: url) else { return }
        
        guard let r = try? JSONDecoder().decode(PokemonResponse.self, from: data) else { return }
        
        response = r
    }
}

struct PokemonResponse: Codable {
    var weight: Int = 0
    var height: Int = 0
    var abilities: [AbilitySlot] = []
    var sprites: Sprites = Sprites()
    var types: [Types] = []
}

struct AbilitySlot: Codable {
    var ability: Ability
    var is_hidden: Bool
    var slot: Int
}

struct Ability: Codable {
    var name: String?
    var url: String?
}

extension Ability: Identifiable {
    var id: String { name ?? UUID().uuidString }
}

struct Sprites: Codable {
    var front_default: String?
    var other: OtherSprites?
}

struct OtherSprites: Codable {
    var home: HomeSprites?
}

struct HomeSprites: Codable {
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
}

struct Types: Codable {
    var slot: Int
    var type: TypeDetail
}

struct TypeDetail: Codable {
    var name: String?
    var url: String?
}
