//
//  GameInfo.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 11/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

class GameInfo {
    
    public let currentQuestion: Observable<Int>
    public init(_ currentQuestion: Int) {
        self.currentQuestion = Observable(currentQuestion)
    }
 
}
