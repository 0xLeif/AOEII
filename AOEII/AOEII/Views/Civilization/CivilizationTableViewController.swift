//
//  CivilizationTableView.swift
//  AOEII
//
//  Created by Zach Eriksen on 12/15/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import SLog
import Combine

class CivilizationTableView: UIViewController {
    private var bag: [AnyCancellable] = []
    
    var civilizations: [Civilization] = [] {
        didSet {
            reloadView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        log.debug.entry {
            "Init AOEII ViewController"
        }
        
        Navigate.shared.configure(controller: navigationController)
        Navigate.shared.set(title: "Civilizations")
        
        view.embed {
            VStack(distribution: .fillEqually) {
                [
                    Spacer(),
                    VStack {
                        [
                            LoadingView(forStyle: .large)
                                .configure { $0.color = .darkGray }
                                .start(),
                            Label.title1("Loading Civilizations...")
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
    
    private func navButton(forCivilization civ: Civilization) -> UIView {
        NavButton(destination: ViewController {
            View(backgroundColor: .white) {
                SafeAreaView {
                    CivilizationDetailView(civ)
                }
            }
        }, style: .push) {
            Label(civ.name)
        }
    }
    
    private func fetchData() {
        API.instance.civilizations().sink(receiveCompletion: { (completion) in
            if case .failure(let error) = completion {
                Navigate.shared.toast(style: .error, secondsToPersist: 3) {
                    Label(error.localizedDescription)
                }
            }
        }) { (list) in
            self.civilizations = list.civilizations ?? []
        }
        .store(in: &bag)
    }
    
    private func reloadView() {
        DispatchQueue.main.async {
            self.view.clear().embed {
                SafeAreaView {
                    Table {
                        self.civilizations.map { self.navButton(forCivilization: $0) }
                    }
                }
            }
        }
    }
}
