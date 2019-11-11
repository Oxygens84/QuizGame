//
//  GameStrategy.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 11/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

enum GameStrategy: Int {
    case normal = 0
    case random = 1
    
    func index() -> Int {
        return self.rawValue
    }
}
