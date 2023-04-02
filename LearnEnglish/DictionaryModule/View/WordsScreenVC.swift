//
//  WordsScreenVC.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 17.03.2023.
//

import UIKit

class WordsScreenVC: UIViewController {
    
    let array = parsingJSON()
    
    private var adapter: TableViewAdapter?
    
    private lazy var tableView: UITableView = {
        UITableView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        view.backgroundColor = .white
        adapter = TableViewAdapter(tableView: tableView, wordModel: array)
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
        }
    }
}

