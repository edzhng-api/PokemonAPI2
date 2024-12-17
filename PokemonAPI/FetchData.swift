//
//  FetchData.swift
//  PokemonAPI
//
//  Created by Edison Zheng (student LM) on 12/17/24.
//

import Foundation

struct FetchData {
    mutating func getData() async {
        var URLString = "https://newsapi.org/v2/everything?q=roblox&language=en&sortBy=publishedAt&apiKey=91d509dcf2e34ebd96eb0525be6751bd"
        
        guard let url = URL(string: URLString) else {return}
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {return}
        
    }
}
