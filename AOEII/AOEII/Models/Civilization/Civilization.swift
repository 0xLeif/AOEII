//
//  Civilization.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/14/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import Foundation

struct Civilization: Codable {
    let id: Int
    let name: String
    let expansion: String
    let army_type: String
    let unique_unit: [String]
    let unique_tech: [String]
    let team_bonus: String
    let civilization_bonus: [String]
}

struct CivilizationList: Codable {
    let civilizations: [Civilization]?
}
