//
//  GameSettingsViewController.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 27.09.2021.
//

import UIKit

class GameSettingsViewController: UIViewController {
    @IBOutlet weak var gameSettingsLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var settingsSegmentControl: UISegmentedControl!
    
    var selectedDifficulty: GameDifficulty {
        switch self.settingsSegmentControl.selectedSegmentIndex {
        case 0: return .straight
        case 1: return .random
        default: return .straight
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // MARK: - Config the controller elements design
        
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.3257462978, blue: 0.5501866937, alpha: 1)
        configScreenElement(gameSettingsLabel, .white, nil, .clear, UIColor.clear.cgColor)
        gameSettingsLabel.textColor = .white
        configScreenElement(settingsLabel, .white, nil, .clear, UIColor.clear.cgColor)
        settingsLabel.textColor = .white
        configScreenElement(settingsSegmentControl, .white, 20, nil, nil)
        settingsSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        settingsSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        
        // Выставляем выбранное положение сегментного переключателя
        
        setupSettingsSegmentContorol(difficultyLevel: Game.shared.gameSession?.gameDifficulty)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Переопределяем сложность игры в GameSession в Singletone Game
    override func viewWillDisappear(_ animated: Bool) {
            Game.shared.gameSession?.gameDifficulty = self.selectedDifficulty
    }
    
    // Функция определения положения ползунка сегментного переключателя
    
    func setupSettingsSegmentContorol(difficultyLevel: GameDifficulty?) {
        switch difficultyLevel {
        case .straight:
            settingsSegmentControl.selectedSegmentIndex = 0
        case .random:
            settingsSegmentControl.selectedSegmentIndex = 1
        case .none:
            settingsSegmentControl.selectedSegmentIndex = 0
        }
    }
}
