//
//  ResultsTableViewController.swift
//  MillionaireGame
//
//  Created by Denis Kazarin on 22.09.2021.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.backgroundColor = #colorLiteral(red: 0, green: 0.3257462978, blue: 0.5501866937, alpha: 1)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "resultCell")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    //Создаем таблицу результатов
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Создаем заголовок таблицы результатов
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.text = "Результаты:"
        headerLabel.backgroundColor = .clear
        headerLabel.textColor = .white
        headerLabel.center = CGPoint(x: 0, y: 0)
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 25)
        return headerLabel
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    // Осуществляем наполнение таблицы результатов
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        configScreenElement(cell, nil, 0, .clear, UIColor.clear.cgColor)
        cell.textLabel?.textColor = .white

        return cell
    }

}
