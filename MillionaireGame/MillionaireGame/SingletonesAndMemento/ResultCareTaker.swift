//
//  ResultCareTaker.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 23.09.2021.
//

import Foundation

class ResultCareTaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "result"
    
    func saveGame(results: [Result]) {
        do {
            let data = try encoder.encode(results)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadGame() -> [Result]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([Result].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
