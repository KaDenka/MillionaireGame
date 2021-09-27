//
//  QuestionsStrategy.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 27.09.2021.
//

import Foundation

protocol QuestionsStrategy {
    func makeQuestionsQueue(questions: [Question]) -> [Question]
}

final class StraightGameStrategy: QuestionsStrategy {
    func makeQuestionsQueue(questions: [Question]) -> [Question] {
        let queuedQuestions = questions
        return queuedQuestions
    }
}

final class RandomGameStrategy: QuestionsStrategy {
    func makeQuestionsQueue(questions: [Question]) -> [Question] {
        var queuedQuestions: [Question] = []
        for i in questions.shuffled() {
            queuedQuestions.append(i)
        }
        return queuedQuestions
    }
}
