//
//  Question.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 21.09.2021.
//

import Foundation

struct Question {
    let question: String
    let answer: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
}
