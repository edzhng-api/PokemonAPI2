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
        
        guard let url = URL(string: URLString) else {return}
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {return}
        
        guard let r = try? JSONDecoder().decode(PokemonResponse.self, from: data) else {return}
        
        response = r
    }
}

struct PokemonResponse: Codable {
    var weight: Int = 0
    var abilities: [Ability] = []
}

struct Ability: Codable {
    var name: String?
    var url: URL?
}

extension Ability: Identifiable {
    var id: String {name ?? " "}
}
