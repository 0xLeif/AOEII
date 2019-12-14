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
            "Init AOEII ViewController"
        }
        
        Navigate.shared.configure(controller: navigationController)
        
        view.embed {
            SafeAreaView {
                Table {
                    [
                        NavButton(destination: ViewController {
                            View(backgroundColor: .white) {
                                SafeAreaView {
                                    Label("AOE Info")
                                }
                            }
                        }, style: .push) {
                            Label("Some Info")
                        }
                    ]
                }
            }
        }
    }
}
