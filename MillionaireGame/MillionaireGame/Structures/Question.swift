//
//  Question.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 21.09.2021.
//

import Foundation

struct Question {
    let question: String
    let firstVariant: String
    let secondVariant: String
    let thirdVariant: String
    let rightAnswer: String
}

class gameDataBase {
    
    var gameQuestions: [Question] = []
    
    var questionOne: Question = .init(question: "Вопрос", firstVariant: "Первый ответ", secondVariant: "Второй ответ", thirdVariant: "Третий ответ", rightAnswer: "Правильный ответ")
    
    var questionTwo: Question = .init(question: "Вопрос2", firstVariant: "Первый ответ2", secondVariant: "Второй ответ2", thirdVariant: "Третий ответ2", rightAnswer: "Правильный ответ2")
    
}

