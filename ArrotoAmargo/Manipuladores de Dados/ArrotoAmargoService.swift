//
//  ArrotoAmargoService.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 12/07/21.
//

import Foundation

class ArrotoAmargoService {

    static func getCervejas() -> [Cerveja] {
        load("cervejaDados.json")
    }
    
    static func getEstilos() -> [EstiloCerveja] {
        load("estiloDados.json")
    }
    
    static func getCervejarias() -> [Cervejaria] {
        load("cervejariaDados.json")
    }
    
    static func getAvaliacoes() -> [Avaliacao] {
        load("avaliacaoDados.json")
    }

    private static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

}
