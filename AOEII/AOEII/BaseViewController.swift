//
//  BaseViewController.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/14/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import SLog

let log = SLogger(fileNamePrefix: "AOEII")

class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        log.debug.entry {
            "Init AOEII BaseViewController"
        }
        
        Navigate.shared.configure(controller: navigationController)
        Navigate.shared.set(title: "Age of Empires II")
        
        view.embed {
            Table(defaultCellHeight: 60) {
                [
                    NavButton(destination: CivilizationTableView(), style: .push) {
                        Label("Civilization").padding()
                    }
                ]
            }
            
        }
    }
}
