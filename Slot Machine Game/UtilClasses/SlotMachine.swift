//
//  SlotMachine.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-21.
//

import Foundation

class SlotMachine{
    var credits: Float?
    var winnerPaid: Float?
    var currentBet: Float?
    
    init(credits: Float = 1000.0, winnerPaid: Float = 0.0, currentBet: Float = 0.0) {
        self.credits = credits
        self.winnerPaid = winnerPaid
        self.currentBet = currentBet
    }
    
    func isValidBet(bet: Float) -> Bool{
        return(bet <= credits!)
    }
    
}
