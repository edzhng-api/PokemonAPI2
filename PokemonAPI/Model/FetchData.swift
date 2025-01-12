//
//  FetchData.swift
//  PokemonAPI
//
//  Created by Edison Zheng (student LM) on 12/17/24.
//

import Foundation

struct FetchData {
    var response: Response = Response()
    
    mutating func getData() async {
        let URLString = "https://pokeapi.co/api/v2/pokemon?limit=1025"
        
        guard let url = URL(string: URLString) else {return}
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {return}
        
        guard let r = try? JSONDecoder().decode(Response.self, from: data) else {return}
        
        response = r
    }
}

struct Response: Codable {
    var results: [Pokemon] = []
}

struct Pokemon: Codable {
    var name: String?
    var url: String?
}

extension Pokemon: Identifiable {
    var id: String {name ?? " "}
}
