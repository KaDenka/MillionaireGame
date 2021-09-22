//
//  GameTemporaryDataBase.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 22.09.2021.
//

import Foundation

final class GameTemporaryDataBase {
    static let shared = GameTemporaryDataBase()
    
    var gameQuestions = [
        Question.init(question: "Какого цвета елка?", answer: [.init(text: "Синего", correct: false), .init(text: "Красного", correct: false), .init(text: "Зеленого", correct: true), .init(text: "Желтого", correct: false)]),
        Question.init(question: "Сколько пальцев на руке?", answer: [.init(text: "Пять", correct: true), .init(text: "Десять", correct: false), .init(text: "Три", correct: false), .init(text: "Не считал", correct: false)]),
        Question.init(question: "Как называется ближайшая к Земле звезда?", answer: [.init(text: "Альфа-Центавра", correct: false), .init(text: "Вега", correct: false), .init(text: "Сириус", correct: false), .init(text: "Солнце", correct: true)]),
        Question.init(question: "Сколько нот в октаве?", answer: [.init(text: "Восемь", correct: true), .init(text: "Десять", correct: false), .init(text: "Две", correct: false), .init(text: "Четыре", correct: false)]),
        Question.init(question: "Какой валовый внутренний продукт Ливана?", answer: [.init(text: "38 млн.$", correct: false), .init(text: "52 млн.$", correct: true), .init(text: "Какого Ливана?", correct: false), .init(text: "134 млрд. рублей", correct: false)]),
    ]

    private init() {}
    
}
