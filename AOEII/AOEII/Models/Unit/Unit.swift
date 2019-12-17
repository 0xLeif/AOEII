//
//  Unit.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/14/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import Foundation

struct Unit: Codable {
    // Required
    let id: Int
    let name: String
    let expansion: String
    let age: String
    let created_in: String
    let cost: Cost
    let build_time: Int
    let reload_time: Double
    let movement_rate: Double
    let line_of_sight: Int
    let hit_points: Int
    let attack: Int
    let armor: String
    // Optional
    let description: String?
    let attack_delay: Double?
    let range: String?
    let attack_bonus: [String]?
    let armor_bonus: [String]?
    let search_radius: Int?
    let accuracy: String?
    let blast_radius: Double?
}

struct UnitList: Codable {
    let units: [Unit]?
}
