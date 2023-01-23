//
//  JackpotNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-20.
//

import Foundation
import SpriteKit

// For showing the jackpot
class JackpotNode: SKNode {
    
    private var backdropSprite: SKSpriteNode?
    private var jackpotTitle: SKSpriteNode?
    private var jackpotMoney: SKLabelNode?
    
    override init() {
        super.init()
        
        // backdrop of the node
        let backdropTexture = SKTexture(imageNamed: "jackpot-backdrop")
        let backdropSize = CGSize(width: 300.0, height: 275.0)
        backdropSprite = SKSpriteNode(texture: backdropTexture, size: backdropSize)
        backdropSprite?.zPosition = -1
        addChild(backdropSprite!)
        
        // the jackpot title as a texture
        jackpotTitle = SKSpriteNode(imageNamed: "jackpot-title")
        jackpotTitle?.size = CGSize(width: 175, height: 35)
        let jacpotTitleYOffset = -6.0
        jackpotTitle?.position = CGPoint(x: frame.midX, y: frame.midY + jacpotTitleYOffset)
        addChild(jackpotTitle!)
        
        // to show the money in jackpot
        jackpotMoney = SKLabelNode()
        jackpotMoney?.text = "$ 1,000,000"
        jackpotMoney?.fontName = "Rye-Regular"
        jackpotMoney?.fontColor = .white
        jackpotMoney?.fontSize = 38
        jackpotMoney?.zPosition = 1
        let jacpotMoneyYOffset = -65.0
        jackpotMoney?.position = CGPoint(x: frame.midX, y: frame.midY + jacpotMoneyYOffset)
        addChild(jackpotMoney!)
        
        zPosition = 2
    }
    
    // sets the money in jackpot
    func setJackpotMoney(money: Float){
        jackpotMoney?.text = "$ " + String(money)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
