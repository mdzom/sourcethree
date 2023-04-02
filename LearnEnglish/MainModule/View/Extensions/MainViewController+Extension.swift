//
//  MainViewController+Extension.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 28.03.2023.
//

import UIKit

extension MainViewController: MainModuleDelegate {
    func startTraining() {
        let vc = TrainVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
