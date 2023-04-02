//
//  DictionaryTableViewCell.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 17.03.2023.
//

import UIKit
import AVFAudio

final class WordCell: UITableViewCell {
    
    static let reuseId = "WordCell"
    
    private let synthesizer = AVSpeechSynthesizer()
    var text = ""
    
    private lazy var roundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "grayColor")?.cgColor
        return view
    }()
    
    private lazy var playSoundButton: UIButton = {
        let buttonSize: CGFloat = 50
        let button = UIButton.init(type: .system)
        button.addTarget(self, action: #selector(soundButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(systemName: "speaker.wave.2"), for: .normal)
        button.snp.makeConstraints {
            $0.width.height.equalTo(buttonSize)
        }
        button.layer.cornerRadius = buttonSize / 2
        button.backgroundColor = UIColor(named: "grayColor")
        return button
    }()
    
    private lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.text = "wordLabel"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private lazy var useCaseLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "useCaseLabel"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .gray
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10
        stack.axis = .vertical
        stack.addArrangedSubview(wordLabel)
        stack.addArrangedSubview(useCaseLabel)
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ word: WordModel) {
        wordLabel.text = word.word
        useCaseLabel.text = word.translate
        text = word.word
    }
    
    private func setupViews() {
        contentView.addSubview(roundedView)
        contentView.addSubview(playSoundButton)
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        roundedView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(8)
        }
        
        playSoundButton.snp.makeConstraints {
            $0.centerY.equalTo(roundedView)
            $0.left.equalTo(roundedView.snp.left).inset(16)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalTo(roundedView)
            $0.left.equalTo(playSoundButton.snp.right).offset(16)
            $0.right.equalTo(roundedView.snp.right).inset(16)
        }
    }
    
    @objc private func soundButtonTapped() {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
}
