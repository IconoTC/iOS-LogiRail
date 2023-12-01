//
//  CharacterModel.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import Foundation

typealias CharactersModel = [CharacterModel]

struct CharacterModel {
    var name: String
    var job: String
    var image: String?
    var description: String?
}
