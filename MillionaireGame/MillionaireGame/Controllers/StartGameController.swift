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
        
        //Конфигурируем элементы интерфейса
        
        configScreenElement(startNewGameButton, .white, 30, nil, nil)
        configScreenElement(resultsButton, .white, 30, nil, nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func tapTheStartGameButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func tapResultButtonAction(_ sender: UIButton) {
    }
    
    
}


// MARK: - Config Elements of Controller Function
// Функция для конфигурирования элементов интерфейса на контроллерах

public func configScreenElement<T: UIView>(_ controllerElement: T, _ tintColor: UIColor?, _ cornerRadius: CGFloat?, _ backgroundColor: UIColor?, _ colorOfBorder: CGColor?) {
    
    let tint = tintColor ?? .white
    let radius = cornerRadius ?? 20
    let background = backgroundColor ?? #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.2977679928)
    let border = colorOfBorder ?? UIColor.white.cgColor
    
    // Задаем цвет текста кнопки/лейбла
    controllerElement.tintColor = tint
    // Задаем форму кнопки/лейбла
    controllerElement.layer.cornerRadius = radius
    // Задаем цвет кнопки/лейбла
    controllerElement.backgroundColor = background
    // Задаем цвет и размер границ кнопки/лейбла
    controllerElement.layer.borderColor = border
    controllerElement.layer.borderWidth = 1.5
    controllerElement.clipsToBounds = true
}
