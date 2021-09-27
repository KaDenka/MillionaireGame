//
//  GameSettingsViewController.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 27.09.2021.
//

import UIKit

enum GameDifficulty {
    case straight, random
}

class GameSettingsViewController: UIViewController {
    @IBOutlet weak var gameSettingsLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var settingsSegmentControl: UISegmentedControl!
    
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
