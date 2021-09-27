//
//  GameSession.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 22.09.2021.
//

import Foundation

class GameSession {
    
    var totalAnsweredQuestions: Int
    var totalEarnedMoney: Int
    var gameDifficulty: GameDifficulty
   
    
    init (totalAnsweredQuestions: Int, totalEarnedMoney: Int, gameDifficulty: GameDifficulty) {
        self.totalAnsweredQuestions = totalAnsweredQuestions
        self.totalEarnedMoney = totalEarnedMoney
        self.gameDifficulty = gameDifficulty
    }
}

