//
//  WordModel.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 17.03.2023.
//

import Foundation

struct WordModel: Decodable {
    let id: Int
    let word: String
    let translate: String
    let order: Int
}
