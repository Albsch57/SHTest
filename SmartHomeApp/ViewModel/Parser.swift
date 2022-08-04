//
//  Parser.swift
//  SmartHomeApp
//
//  Created by Alona on 30.07.2022.
//

import Foundation

struct Parser {
    func parse(comp: @escaping (Welcome) ->()) {
        guard let api = URL(string: "http://storage42.com/modulotest/data.json") else { return }
        
        URLSession.shared.dataTask(with: api) {
            data, response, error in
            if error != nil {
                return
            }
            do {
            let result = try JSONDecoder().decode(Welcome.self, from: data!)
                comp(result)
            } catch {
        }
        }.resume()
    }
}

