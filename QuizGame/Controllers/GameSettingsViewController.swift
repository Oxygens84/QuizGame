//
//  GameSettingsViewController.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 11/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import UIKit

class GameSettingsViewController: UIViewController {

    @IBOutlet weak var gameStrategyControl: UISegmentedControl!
    
    @IBAction func gameStrategyChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Game.shared.gameStrategy = .normal
        case 1:
            Game.shared.gameStrategy = .random
        default:
            break;
        }
        
    }
    
    override func viewDidLoad() {
        gameStrategyControl.selectedSegmentIndex = Game.shared.gameStrategy.index()
        super.viewDidLoad()
    }
    
}
