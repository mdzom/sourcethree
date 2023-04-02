//
//  TrainVC.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 27.03.2023.
//

import UIKit

class TrainVC: UIViewController {
    
    private lazy var swipeToRightRecognizer: UISwipeGestureRecognizer = {
        let recognizer = UISwipeGestureRecognizer(target: self,
                                                  action: #selector(pushBackButton))
        recognizer.direction = .right
        return recognizer
    }()
    
    private lazy var leftBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                     style: .done,
                                     target: self,
                                     action: #selector(pushBackButton))
        return button
    }()
    
    private lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.text = "word"
        label.textColor = .blue
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = UIImage(named: "test")
        view.snp.makeConstraints {
            $0.height.equalTo(view.snp.width).inset(50)
        }
        return view
    }()
    
    private lazy var wordDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "description"
        return label
    }()
    
    private lazy var soundButton: UIButton = {
        let buttonSize: CGFloat = 50
        let button = UIButton.init(type: .system)
        button.addTarget(self,
                         action: #selector(playSound),
                         for: .touchUpInside)
        if let image = UIImage(systemName: "speaker.wave.2") {
            let newImage = image.withConfiguration(UIImage
                .SymbolConfiguration(pointSize: 16, weight: .medium))
                .withTintColor(.white, renderingMode: .alwaysOriginal)
            button.setImage(newImage, for: .normal)
            button.backgroundColor = .blue
        }
        button.layer.cornerRadius = 10
        button.snp.makeConstraints {
            $0.width.height.equalTo(buttonSize)
        }
        button.layer.cornerRadius = buttonSize / 2
        return button
    }()
    
    private lazy var firstOptionButton: UIButton = {
        let button = createButton("1")
        return button
    }()
    
    private lazy var secondOptionButton: UIButton = {
        let button = createButton("2")
        return button
    }()
    
    private lazy var thirdOptionButton: UIButton = {
        let button = createButton("3")
        return button
    }()
    
    private lazy var fourthOptionButton: UIButton = {
        let button = createButton("4")
        return button
    }()
    
    private lazy var dontKnowButton: UIButton = {
        let button = createButton("Не знаю")
        button.tintColor = .gray
        button.layer.borderWidth = 0
        return button
    }()
    
    private lazy var stackViewWithImage: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        stack.layer.cornerRadius = 20
        stack.backgroundColor = .white
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private lazy var stackViewWithButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "grayColor")
        addToNavigationItem()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addGestureRecognizer(swipeToRightRecognizer)
        view.addSubview(stackViewWithImage)
        stackViewWithImage.addArrangedSubview(wordLabel)
        stackViewWithImage.addArrangedSubview(imageView)
        stackViewWithImage.addArrangedSubview(wordDescriptionLabel)
        stackViewWithImage.addArrangedSubview(soundButton)
        view.addSubview(stackViewWithButtons)
        stackViewWithButtons.addArrangedSubview(createHorisontalStackView([firstOptionButton, secondOptionButton]))
        stackViewWithButtons.addArrangedSubview(createHorisontalStackView([thirdOptionButton, fourthOptionButton]))
        stackViewWithButtons.addArrangedSubview(createHorisontalStackView([dontKnowButton]))
    }
    
    private func setupConstraints() {
        stackViewWithImage.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        stackViewWithButtons.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    private func addToNavigationItem() {
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    private func createButton(_ text: String) -> UIButton {
        let button = UIButton.init(type: .system)
        button.addTarget(self,
                         action: #selector(pushButton),
                         for: .touchUpInside)
        button.setTitle(text, for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.blue.cgColor
        button.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        return button
    }
    
    private func createHorisontalStackView(_ views: [UIView]) -> UIStackView {
        let stack = UIStackView()
        views.forEach {
            stack.addArrangedSubview($0)
        }
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }
    
    @objc private func pushButton(_ sender: UIButton) {
        print("button tapped")
    }
    
    @objc private func playSound() {
        print("play")
    }
    
    @objc private func pushBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}
