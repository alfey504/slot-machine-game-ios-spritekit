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
    
    static let SLOT_ITEM_ROTTEN_APPLE: Int = 0
    static let SLOT_ITEM_ORANGE: Int = 1
    static let SLOT_ITEM_PEACH: Int = 2
    static let SLOT_ITEM_AVOCADO: Int = 3
    static let SLOT_ITEM_STRAWBERRY: Int = 4
    static let SLOT_ITEM_BANANA: Int = 5
    static let SLOT_ITEM_APPLE: Int = 6
    static let SLOT_ITEM_LEMON: Int = 7
    
    static let SLOT_ITEM_BASE: Array<Int> = [0, 1, 1, 1, 1, 1, 1, 5]
    static let SLOT_ITEM_MULTIPLIERS: Array<Array<Int>> = [
        [0, 1, 1, 1, 1, 1, 1, 5],
        [0, 2, 2, 3, 4, 5, 10, 20],
        [0, 10, 20, 30, 40, 50, 75, 100]
    ]
    
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
    
    // setting the bet
    func setBet(bet: Float){
        self.currentBet = bet
        self.credits! -= currentBet!
        self.winnerPaid! += bet
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
        let jackPotTry = (Double.random(in: 0.000000...1.0000000) * 51) + 1
        let jackPotWin = (Double.random(in: 0.000000...1.0000000) * 51) + 1
        if(jackPotTry == jackPotWin || SIMULATE_JACKPOT_WIN!){
            return true
        }else{
            print("SlotMachine->checkJackpot(): Did not win jackpot")
            return false
        }
    }
    
    func checkRange(value: Int, lower: Int, upper: Int) -> Int{
        if(value >= lower && value <= upper){
            return value
        }else{
            return value + 27;
        }
    }
    
    func getItemFromRandom(random: Int) -> Int{
        
        switch random{
            case checkRange(value: random, lower: 1, upper: 27):
                return SlotMachine.SLOT_ITEM_ROTTEN_APPLE
            case checkRange(value: random, lower: 28, upper: 37):
                return SlotMachine.SLOT_ITEM_ORANGE
            case checkRange(value: random, lower: 38, upper: 46):
                return SlotMachine.SLOT_ITEM_PEACH
            case checkRange(value: random, lower: 47, upper: 54):
                return SlotMachine.SLOT_ITEM_AVOCADO
            case checkRange(value: random, lower: 55, upper: 59):
                return SlotMachine.SLOT_ITEM_STRAWBERRY
            case checkRange(value: random, lower: 60, upper: 62):
                return SlotMachine.SLOT_ITEM_BANANA
            case checkRange(value: random, lower: 63, upper: 64):
                return SlotMachine.SLOT_ITEM_APPLE
            case checkRange(value: random, lower: 64, upper: 65):
                return SlotMachine.SLOT_ITEM_LEMON
            default:
                return SlotMachine.SLOT_ITEM_ROTTEN_APPLE
        }
    }
    
    func spinSlot() -> SlotSpinResult{
        
        var spinOutCome = [1, 3, 6]
        var itemCount = [0, 0, 0, 0, 0, 0, 0]
        
        
        for slot in 0...2{
            let random = Int((Double.random(in: 0.000000...1.0000000) * 51) + 1)
            spinOutCome[slot] = getItemFromRandom(random: random)
            print("SlotMachine -> spinSlot(): spinOutCome[slot]: ", spinOutCome[slot])
            itemCount[spinOutCome[slot]] += 1
        }
        
        let (win, price) = evaluateResult(outcomeCount: itemCount)
        let result = SlotSpinResult(spinOutCome: spinOutCome, spinItemsCount: itemCount, win: win, winAmount: price)
        return(result)
    }
    
    func evaluateResult(outcomeCount: Array<Int>) -> (Bool, Float){
        if(outcomeCount[SlotMachine.SLOT_ITEM_ROTTEN_APPLE] > 0){
            return (false, 0.0)
        }
        
        let (index, count) = findHighest(array: outcomeCount)
        
        let wining = currentBet! * Float(SlotMachine.SLOT_ITEM_MULTIPLIERS[count-1][index])
        
        self.credits! += wining
        return(true, wining)
    }
    
    func findHighest(array: Array<Int>) -> (Int, Int){
        var largestIndex = 0
        var largestElement = 0
        for i in 0...array.count-1{
            if(array[i] >= largestElement){
                largestElement = array[i]
                largestIndex = i
            }
        }
        return(largestIndex, largestElement)
    }
    
    func reset(credits: Float = 1000.0, winnerPaid: Float = 0.0, currentBet: Float = 0.0, jackpot: Float = 5000, SIMULATE_JACKPOT_WIN: Bool = false) {
        self.credits = credits
        self.winnerPaid = winnerPaid
        self.currentBet = currentBet
        self.jackPot = jackpot
        self.SIMULATE_JACKPOT_WIN = SIMULATE_JACKPOT_WIN
    }
}
