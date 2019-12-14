//
//  Structure.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/14/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import Foundation

struct Structure: Codable {
    // Required
    let id: Int
    let name: String
    let expansion: String
    let age: String
    let cost: Cost
    let build_time: Int
    let hit_points: Int
    let line_of_sight: Int
    let armor: Int
    // Optionals
    let description: String?
    let range: String?
    let attack: Int?
    let reload_time: Double?
    let special: [String]?
}

struct StructureList: Codable {
    let structures: [Structure]?
}
