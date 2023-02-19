//
//  UserDefaultsHandler.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-02-18.
//

import Foundation

struct USER_DEFAULT_KEYS{
    static let JACKPOT_KEY = "jackpot"
    static let HIGHEST_PAYOUT_KEY = "highest_payout"
}

class UserDefaultsHandler{
    
    static func saveJackpot(jackPot: Float){
        let userDeafaults = UserDefaults.standard
        userDeafaults.set(jackPot, forKey: USER_DEFAULT_KEYS.JACKPOT_KEY)
    }
    
    static func saveHighestPayout(highestPayout: Float){
        let userDeafaults = UserDefaults.standard
        userDeafaults.set(highestPayout, forKey: USER_DEFAULT_KEYS.HIGHEST_PAYOUT_KEY)
    }
    
    static func loadJackpot() -> Float{
        let userDeafaults = UserDefaults.standard
        return userDeafaults.float(forKey: USER_DEFAULT_KEYS.JACKPOT_KEY)
    }
    
    static func loadHighestPayout() -> Float{
        let userDeafaults = UserDefaults.standard
        return userDeafaults.float(forKey: USER_DEFAULT_KEYS.HIGHEST_PAYOUT_KEY)
    }
}
