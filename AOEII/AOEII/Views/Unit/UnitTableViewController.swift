//
//  UnitTableViewController.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/16/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import SLog
import Combine

class UnitTableViewController: UIViewController {
    private var bag: [AnyCancellable] = []
    
    var units: [Unit] = [] {
        didSet {
            reloadView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        log.debug.entry {
            "Init AOEII UnitTableViewController"
        }
        
        Navigate.shared.configure(controller: navigationController)
        Navigate.shared.set(title: "Units")
        
        view.embed {
            VStack(distribution: .fillEqually) {
                [
                    Spacer(),
                    VStack {
                        [
                            LoadingView(forStyle: .large)
                                .configure { $0.color = .darkGray }
                                .start(),
                            Label.title1("Loading Units...")
                                .configure { $0.textAlignment = .center }
                        ]
                    },
                    
                    Spacer()
                ]
            }
            
        }
        .configure {
            $0.backgroundColor = .white
        }
        
        fetchData()
    }
    
    private func navButton(forUnit unit: Unit) -> UIView {
        NavButton(destination: ViewController {
            View(backgroundColor: .white) {
                SafeAreaView {
                    UnitDetailView(unit)
                }
            }
        }, style: .push) {
            Label(unit.name ?? "")
        }
    }
    
    private func fetchData() {
        API.instance.units().sink(receiveCompletion: { (completion) in
            if case .failure(let error) = completion {
                Navigate.shared.toast(style: .error, secondsToPersist: 3) {
                    Label(error.localizedDescription)
                }
            }
        }) { (list) in
            self.units = list.units ?? []
        }
        .store(in: &bag)
    }
    
    private func reloadView() {
        DispatchQueue.main.async {
            self.view.clear().embed {
                SafeAreaView {
                    Table {
                        self.units.map { self.navButton(forUnit: $0) }
                    }
                }
            }
        }
    }
}
