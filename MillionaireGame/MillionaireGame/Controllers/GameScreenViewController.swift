//
//  GameScreenViewController.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 21.09.2021.
//

import UIKit

protocol GameScreenDelegate: AnyObject {
    func didEndGame(answeredQuestions: Int, earnedMoney: Int)
}

class GameScreenViewController: UIViewController {
    
    // Подгружаем базу данных для игры
    
    let gameQuestions = GameTemporaryDataBase.shared.gameQuestions
    
    // Создаем переменные для обеспечения начала игры
    var rightAnsweredQuestions = 0
    var currentPoints = 0
    var questionPoints = 1000
    var questionIndex = 0
    let totalQuestions = GameTemporaryDataBase.shared.gameQuestions.count
    weak var gameDelegate: GameScreenDelegate?
    
    
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
    @IBOutlet weak var fiftyFiftyButton: UIButton!
    @IBOutlet weak var friendCallButton: UIButton!
    @IBOutlet weak var audienceHelpButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var endGameButton: UIButton!
    @IBOutlet weak var answersTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.answersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "answerCell")
        
        // Конфигурируем все элементы контроллера перед его загрузкой
        
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.5505234674)
        configScreenElement(currentScoreLabel, nil, nil, nil, nil)
        configScreenElement(playedSumLabel, nil, nil, nil, nil)
        configScreenElement(questionShowLabel, nil, nil, nil, nil)
        questionShowLabel.textColor = .white
        configScreenElement(fiftyFiftyButton, nil, fiftyFiftyButton.bounds.height/2, nil, nil)
        configScreenElement(friendCallButton, nil, friendCallButton.bounds.height/2, nil, nil)
        configScreenElement(audienceHelpButton, nil, audienceHelpButton.bounds.height/2, nil, nil)
        configScreenElement(nextQuestionButton, nil, 10, nil, nil)
        configScreenElement(endGameButton, nil, 10, nil, nil)
        configScreenElement(answersTableView, nil, 0, .clear, UIColor.clear.cgColor)
        
        //Добавляем дополнительный подготовительный функционал к элементам
        
        nextQuestionButton.isHidden = true
        currentScoreLabel.text = "Выигрыш: \(currentPoints)"
        playedSumLabel.text = "Цена вопроса: \(questionPoints)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answersTableView.dataSource = self
        answersTableView.delegate = self
        
        startGame(index: questionIndex)
        
        
        
        
    }
    
    @IBAction func tapEndGameButton(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(identifier: "StartGameScreen") as! StartGameController
        selectionVC.modalPresentationStyle = .fullScreen
        selectionVC.modalTransitionStyle = .flipHorizontal
        present(selectionVC, animated: true, completion: nil)
    }
    
    @IBAction func tapNextQuestionButtonAction(_ sender: Any) {
        questionIndex += 1
        
        if questionIndex <= gameQuestions.count - 1 {
            startGame(index: questionIndex)
        } else {
            dismiss(animated: true)
        }
        
    }
    
}

extension GameScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        gameQuestions[questionIndex].answer.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Конфигурирую ячейку и текст в ней
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell") else {return UITableViewCell()}
        configScreenElement(cell, nil, 10, nil, nil)
        cell.textLabel?.center = CGPoint(x: 0, y: 0)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = gameQuestions[questionIndex].answer[indexPath.section].text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if gameQuestions[questionIndex].answer[indexPath.section].correct == true {
            rightAnsweredQuestions += 1
            currentPoints = currentPoints + questionPoints
            currentScoreLabel.text = "Выигрыш: \(currentPoints)"
            questionPoints = questionPoints * 2
            playedSumLabel.text = "Цена вопроса: \(questionPoints)"
            questionIndex += 1
            if questionIndex <= gameQuestions.count - 1 {
                startGame(index: questionIndex)
            } else { endGame() }
        } else { endGame() }
    }
    
    // MARK: - Start Game Function
    
     func startGame (index: Int) {
        
        questionShowLabel.text = gameQuestions[index].question
        answersTableView.reloadData()
    }
    
    
    
    func endGame() {
        self.gameDelegate?.didEndGame(answeredQuestions: rightAnsweredQuestions, earnedMoney: currentPoints)
        dismiss(animated: true)
    }

}


