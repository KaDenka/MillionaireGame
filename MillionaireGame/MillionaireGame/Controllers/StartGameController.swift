//
//  StartGameController.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 21.09.2021.
//

import UIKit

// Создаем контроллер для стартового экрана приложения

class StartGameController: UIViewController {
    
// MARK: - Create the Controller Elements
    
    @IBOutlet weak var gameLogo: UIImageView!
    
    @IBOutlet weak var startNewGameButton: UIButton!
    
    @IBOutlet weak var resultsButton: UIButton!
    
// MARK: - Config the Controller Elements Design
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.5505234674) // Устанавливаем цвет контроллера
        
        gameLogo.image = UIImage(named: "millionaireGameLogo") // Добавляем логотип игры на контроллер из хранилища файлов
        // Задаем цвет текста кнопок контроллера
        startNewGameButton.tintColor = .white
        resultsButton.tintColor = .white
        // Задаем форму кнопок контроллера
        startNewGameButton.layer.cornerRadius = 30
        resultsButton.layer.cornerRadius = 30
        // Задаем цвет кнопок
        startNewGameButton.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.2977679928)
        resultsButton.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.2977679928)
        // Задаем цвет и размер границ кнопок
        startNewGameButton.layer.borderColor = UIColor.white.cgColor
        resultsButton.layer.borderColor = UIColor.white.cgColor
        startNewGameButton.layer.borderWidth = 1.5
        resultsButton.layer.borderWidth = 1.5
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }


}

