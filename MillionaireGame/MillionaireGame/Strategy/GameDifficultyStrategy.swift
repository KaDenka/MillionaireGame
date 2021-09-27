//
//  GameDifficultyStrategy.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 27.09.2021.
//

import Foundation

protocol QuestionsStrategy {
    func makeQuestionsQueue()
}

final class StraightGameStrategy: QuestionsStrategy {
    func makeQuestionsQueue() {
        
    }
}

final class RandomGameStrategy: QuestionsStrategy {
    func makeQuestionsQueue() {
        
    }
}
