//
//  GameCaretaker.swift
//  QuizGame
//
//  Created by Oxana Lobysheva on 06/11/2019.
//  Copyright © 2019 Oxana Lobysheva. All rights reserved.
//

import Foundation

class GameCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let recordsKey = "recordsKey"
    
    func saveRecords(_ records: [Record]) throws {
        let data = try self.encoder.encode(records)
        UserDefaults.standard.set(data, forKey: self.recordsKey)
    }
    
    func loadRecords() throws -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: self.recordsKey) else {
            return []
        }
        return try self.decoder.decode([Record].self, from: data)
    }
}
