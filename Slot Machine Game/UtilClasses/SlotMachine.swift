//
//  SlotMachine.swift
//  Slot Machine Game
//
//  Created on 2023-01-20.
//
//  Authors
//  --------------------------------------
//  Abraham Alfred Babu
//  Student ID : 301270598
//
//  Pia Mae Obias
//  Student ID: 301283632
//
//  Satender Yadav
//  Student ID: 301293305
//

import Foundation

// class to handle all the slot machine functions
class SlotMachine{
    
    var credits: Float?
    var winnerPaid: Float?
    var currentBet: Float?
    var jackPot: Float?
    
    private var SIMULATE_JACKPOT_WIN: Bool?
    
    init(credits: Float = 1000.0, winnerPaid: Float = 0.0, currentBet: Float = 0.0, jackpot: Float = 5000, SIMULATE_JACKPOT_WIN: Bool = false) {
        self.credits = credits
        self.winnerPaid = winnerPaid
        self.currentBet = currentBet
        self.jackPot = jackpot
        self.SIMULATE_JACKPOT_WIN = SIMULATE_JACKPOT_WIN
    }
    
    // verify the enterd bet
    func verifyBet(text: String) -> Bool{
        
        if(text == ""){
            return false
        }
        
        if(!text.isNumber()){
            return false
        }
        
        guard let bet = Float(text) else{
            return false
        }
        
        if(!isValidBet(bet: bet)){
            return false
        }
        
        return true
    }
    
    // check if bet is lower than the credit
    func isValidBet(bet: Float) -> Bool{
        return(bet <= credits!)
    }
    
    // simulats a jackpot win if set to true
    func setSimulateJackpotWin(SIMULATE_JACKPOT_WIN: Bool){
        self.SIMULATE_JACKPOT_WIN = SIMULATE_JACKPOT_WIN
    }
    
    // check for a jackpot win
    func checkJackpotWin() -> Bool {
        let jackPotTry = (Int.random(in: 0...1000) * 51) + 1
        let jackPotWin = (Int.random(in: 0...1000) * 51) + 1
        if(jackPotTry == jackPotWin || SIMULATE_JACKPOT_WIN!){
            return true
        }else{
            print("Did not win jackpot")
            return false
        }
    }
    
}
