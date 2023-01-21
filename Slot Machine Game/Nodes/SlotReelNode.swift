//
//  SolotReelNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-20.
//

import Foundation
import SpriteKit

class SlotReelNode: SKNode{
    
    private var reelBackdrop: SKSpriteNode?
    private var numberLabel: SKLabelNode?
    
    override init(){
        super.init()
        
        let backdropColor = UIColor(red: 21.0/255.0, green: 32.0/255.0, blue: 62.0/255.0, alpha: 1.0)
        let backdropSize = CGSize(width: 100, height: 100)
        reelBackdrop = SKSpriteNode(color: backdropColor, size: backdropSize)
        
        numberLabel = SKLabelNode()
        numberLabel?.text = "7"
        numberLabel?.fontSize = 38
        numberLabel?.fontColor = .white
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
