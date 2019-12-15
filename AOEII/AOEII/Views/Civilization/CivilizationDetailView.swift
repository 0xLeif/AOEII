//
//  CivilizationDetailView.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/15/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit

class CivilizationDetailView: UIView {
    
    private var civilization: Civilization
    
    init(_ civ: Civilization) {
        self.civilization = civ
        super.init(frame: .zero)
        
        log.debug.entry {
            "Init AOEII CivilizationDetailView(civ: \(civ.name))"
        }
        
        Navigate.shared.set(title: civ.name)
        
        embed {
            VStack(distribution: .equalSpacing) {
                [
                    VStack {
                        [
                            Label.title1(civ.name),
                            Label.title3("Expansion: \(civ.expansion)"),
                            Label.title3("\(civ.army_type)")
                        ]
                    }
                    .frame(height: 100),
                    
                    VStack {
                        [
                            Label.headline("Unique Unit(s)")
                            ] + civ.unique_unit
                                .map { Label.subheadline($0).number(ofLines: 3) }
                    },
                    
                    VStack {
                        [
                            Label.headline("Unique Tech")
                            ] + civ.unique_tech
                                .map { Label.subheadline($0).number(ofLines: 3) }
                    },
                    VStack {
                        [
                            Label.headline("Civilization Bonus"),
                            ] + civ.civilization_bonus
                                .map { Label.subheadline($0).number(ofLines: 3) }
                    },
                    Spacer()
                    
                ]
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
