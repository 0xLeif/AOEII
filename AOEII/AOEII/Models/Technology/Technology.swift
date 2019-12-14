//
//  Technology.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/14/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import Foundation

struct Technology: Codable {
    // Required
    let id: Int
    let name: String
    let expansion: String
    let age: String
    let develops_in: String
    let cost: Cost
    let build_time: Int
    // Optional
    let description: String?
    let applies_to: [String]?
}

struct TechnologyList: Codable {
    let technologies: [Technology]?
}
