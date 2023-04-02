//
//  MainViewController.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 19.03.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    private var wordsScreen = WordsScreenVC()
    private var trainingScreen = TrainingScreenVC()
//    let navigation = UINavigationController(rootViewController: TrainingScreenVC())
    private var learnedScreen = LearnedScreenVC()
    
    private lazy var firstButton: SwitchButton = {
        let button = SwitchButton.init(type: .system)
        button.addTarget(self, action: #selector(firstButtonPush), for: .touchUpInside)
        button.setTitle("Словарь", for: .normal)
        return button
    }()
    
    private lazy var secondButton: SwitchButton = {
        let button = SwitchButton.init(type: .system)
        button.addTarget(self, action: #selector(secondButtonPush), for: .touchUpInside)
        button.setTitle("Изучаю", for: .normal)
        return button
    }()
    
    private lazy var thirdButton: SwitchButton = {
        let button = SwitchButton.init(type: .system)
        button.addTarget(self, action: #selector(thirdButtonPush), for: .touchUpInside)
        button.setTitle("Знаю", for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.addArrangedSubview(firstButton)
        stack.addArrangedSubview(secondButton)
        stack.addArrangedSubview(thirdButton)
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureViewControllers()
        setupConstraints()
        
        view.backgroundColor = UIColor(named: "blueColor")
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        trainingScreen.delegate = self
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.left.right.equalToSuperview().inset(16)
        }
        [wordsScreen.view,
         trainingScreen.view,
//         navigation.view,
         learnedScreen.view].forEach {
            $0?.snp.makeConstraints({ make in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(stackView.snp.bottom)
            })
        }
    }
    
    private func configureViewControllers() {
        addChild(wordsScreen)
        addChild(trainingScreen)
//        addChild(navigation)
        addChild(learnedScreen)
        
        view.addSubview(wordsScreen.view)
        view.addSubview(trainingScreen.view)
//        view.addSubview(navigation.view)
        view.addSubview(learnedScreen.view)
        
        wordsScreen.didMove(toParent: self)
        trainingScreen.didMove(toParent: self)
//        navigation.didMove(toParent: self)
        learnedScreen.didMove(toParent: self)
    }
    
    private func hiddenVC() {
        wordsScreen.view.isHidden = true
        trainingScreen.view.isHidden = true
//        navigation.view.isHidden = true
        learnedScreen.view.isHidden = true
    }
    
    
    @objc private func firstButtonPush() {
        hiddenVC()
        wordsScreen.view.isHidden = false
    }
    
    @objc private func secondButtonPush() {
        hiddenVC()
        trainingScreen.view.isHidden = false
//        navigation.view.isHidden = false
        
    }
    
    @objc private func thirdButtonPush() {
        hiddenVC()
        learnedScreen.view.isHidden = false
    }
    
    
}
