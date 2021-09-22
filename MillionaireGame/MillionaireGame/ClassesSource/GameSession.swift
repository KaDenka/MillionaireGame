//
//  GameSession.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 22.09.2021.
//

import Foundation

class GameSession {
    
    var questionsCount: Int
    var prizeMoney: Int
    
    init (questionCount: Int, prizeMoney: Int) {
        self.questionsCount = questionCount
        self.prizeMoney = prizeMoney
    }
    
}
