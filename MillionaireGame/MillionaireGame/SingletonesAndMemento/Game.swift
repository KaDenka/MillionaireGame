//
//  Game.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 21.09.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    var gameSession: GameSession?
    
    private let recordCaretaker = ResultCareTaker()
    
    private(set) var results: [Result] {
        didSet {
            recordCaretaker.saveGame(results: results)
        }
    }
    
    private init() {
        results = recordCaretaker.loadGame() ?? []
    }
    
    func addResult(record: Result) {
        results.append(record)
    }
    
    func clearResult() {
        results.removeAll()
    }
}
