//
//  parsingJSON.swift
//  LearnEnglish
//
//  Created by Gennadij Pleshanov on 31.03.2023.
//

import Foundation

//func parsingJSON(_ completion: @escaping ([WordModel]) -> ()) {
//    guard let path = Bundle.main.path(forResource: "words5000", ofType: "json") else { return }
//    do {
//        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//        let object = try JSONDecoder().decode([WordModel].self, from: data)
//        completion(object)
//    } catch {
//        print(error)
//    }
//}

func parsingJSON() -> [WordModel] {
    var wordModel = [WordModel]()
    guard let path = Bundle.main.path(forResource: "words5000", ofType: "json") else { return [] }
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        wordModel = try JSONDecoder().decode([WordModel].self, from: data)
    } catch {
        print(error)
    }
    return wordModel
}
