//
//  TableViewAdapter.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 21.03.2023.
//

import UIKit

final class TableViewAdapter: NSObject, UITableViewDataSource {
//---
    let wordModel: [WordModel]
//---
    private let tableView: UITableView
    
    
    
    init(tableView: UITableView, wordModel: [WordModel]) {
        self.tableView = tableView
        self.wordModel = wordModel
        super.init()
        self.tableView.register(WordCell.self, forCellReuseIdentifier: WordCell.reuseId)
        self.tableView.allowsSelection = false
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.reuseId,
                                                       for: indexPath) as? WordCell else {
            return UITableViewCell()
        }
        cell.setupCell(wordModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

extension TableViewAdapter: UITableViewDelegate {}
