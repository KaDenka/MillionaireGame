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
    
    init (totalAnsweredQuestions: Int, totalEarnedMoney: Int) {
        self.totalAnsweredQuestions = totalAnsweredQuestions
        self.totalEarnedMoney = totalEarnedMoney
    }
    
    
}
