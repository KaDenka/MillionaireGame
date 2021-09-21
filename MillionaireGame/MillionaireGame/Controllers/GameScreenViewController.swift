//
//  GameScreenViewController.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 21.09.2021.
//

import UIKit

class GameScreenViewController: UIViewController {
    // Создаем переменные для обеспечения начала игры
    var currentPoints = 0
    var questionPoints = 1000
    
    
    // Создаем IBOutlet для всех элементов контроллера
    
    @IBOutlet weak var currentScoreLabel: UILabel! {
        didSet {
            currentScoreLabel.textColor = .yellow
        }
    }
    @IBOutlet weak var playedSumLabel: UILabel! {
        didSet {
            playedSumLabel.textColor = .yellow
        }
    }
    @IBOutlet weak var questionShowLabel: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    @IBOutlet weak var fiftyFiftyButton: UIButton!
    @IBOutlet weak var friendCallButton: UIButton!
    @IBOutlet weak var audienceHelpButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var endGameButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Конфигурируем все элементы контроллера перед его загрузкой
        
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.5505234674)
        configScreenElement(currentScoreLabel, nil, nil, nil, nil)
        configScreenElement(playedSumLabel, nil, nil, nil, nil)
        configScreenElement(questionShowLabel, nil, nil, nil, nil)
        configScreenElement(firstAnswerButton, nil, nil, nil, nil)
        configScreenElement(secondAnswerButton, nil, nil, nil, nil)
        configScreenElement(thirdAnswerButton, nil, nil, nil, nil)
        configScreenElement(fourthAnswerButton, nil, nil, nil, nil)
        configScreenElement(fiftyFiftyButton, nil, fiftyFiftyButton.bounds.height/2, nil, nil)
        configScreenElement(friendCallButton, nil, friendCallButton.bounds.height/2, nil, nil)
        configScreenElement(audienceHelpButton, nil, audienceHelpButton.bounds.height/2, nil, nil)
        configScreenElement(nextQuestionButton, nil, 10, nil, nil)
        configScreenElement(endGameButton, nil, 10, nil, nil)
        
        nextQuestionButton.isHidden = true
        currentScoreLabel.text = "Выигрыш: \(currentPoints)"
        playedSumLabel.text = "Цена вопроса: \(questionPoints)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapEndGameButton(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(identifier: "StartGameScreen") as! StartGameController
        selectionVC.modalPresentationStyle = .fullScreen
        selectionVC.modalTransitionStyle = .flipHorizontal
        present(selectionVC, animated: true, completion: nil)
    }
}



