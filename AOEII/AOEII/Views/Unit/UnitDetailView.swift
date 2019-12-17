//
//  UnitDetailView.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/16/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit

class UnitDetailView: UIView {
    
    private var unit: Unit
    
    init(_ unit: Unit) {
        self.unit = unit
        super.init(frame: .zero)
        
        log.debug.entry {
            "Init AOEII UnitDetailView(civ: \(unit.name ?? ""))"
        }
        
        Navigate.shared.set(title: unit.name ?? "")
        
        embed {
            VStack(distribution: .equalSpacing) {
                [
                    VStack {
                        [
                            Label.title1(unit.name ?? ""),
                            Label.title3("Expansion: \(unit.expansion ?? "")"),
                            Label.title3("Age: \(unit.age ?? "")")
                        ]
                    }
                    .frame(height: 100),
                    
                   
                    Spacer()
                    
                ]
            }
        }
        .debug()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
