//
//  TrainingScreenVC.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 19.03.2023.
//

import UIKit

class TrainingScreenVC: UIViewController {
    
    private var adapter: TableViewAdapter?
    
    private lazy var startLearningButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("Начать обучение", for: .normal)
        button.backgroundColor = UIColor(named: "yellowColor")
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(startLearn), for: .touchUpInside)
        return button
    }()

    private lazy var tableView: UITableView = {
        UITableView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        view.backgroundColor = .white
        adapter = TableViewAdapter(tableView: tableView, numberOfCells: 6)
        
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(startLearningButton)
    }
    
    private func setupConstraints() {
        startLearningButton.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(startLearningButton.snp.bottom).offset(10)
        }
    }
    
    @objc private func startLearn() {
        print("learn")
    }

}
