//
//  GameSession.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 05/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

final class Game {
    
    var game: GameSession?
    var gameStrategy: GameStrategy = .normal
     
    static let shared = Game()
    
    private let recordsCaretaker = GameCaretaker()
    
    private(set) var records: [Record] = [] {
        didSet {
            try? self.recordsCaretaker.saveRecords(self.records)
        }
    }
    
    private init() {
        game = GameSession()
        self.records = (try? self.recordsCaretaker.loadRecords()) ?? []
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}
