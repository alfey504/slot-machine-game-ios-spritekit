//
//  SlotResult.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-02-01.
//

import Foundation

struct SlotSpinResult{
    var spinOutCome: Array<Int>
    var spinItemsCount: Array<Int>
    var win: Bool?
    var winAmount: Float
    
    init(spinOutCome: Array<Int>, spinItemsCount: Array<Int>, win: Bool? = nil, winAmount: Float) {
        self.spinOutCome = spinOutCome
        self.spinItemsCount = spinItemsCount
        self.win = win
        self.winAmount = winAmount
    }
}
