//
//  CharacterModel.swift
//  MVC
//
//  Created by David Jardon on 24/11/23.
//

import Foundation

typealias CharactersModel = [CharacterModel]

struct CharacterModel {
    var name: String
    var job: String
    var image: String?
    var description: String
}
