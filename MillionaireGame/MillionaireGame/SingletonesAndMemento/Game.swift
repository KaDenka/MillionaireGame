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
    
    private init() {}
}
