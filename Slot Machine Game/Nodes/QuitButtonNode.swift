//
//  QuitButtonNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-21.
//

import Foundation
import SpriteKit

class QuitButtonNode: SKNode{
    
    private var quitButtonSprite: SKSpriteNode?
    
    override init() {
        super.init()
        
        quitButtonSprite = SKSpriteNode(imageNamed: "quit-button")
        quitButtonSprite?.size = CGSize(width: 100.0, height: 50.0)
        quitButtonSprite?.position = CGPoint(x: frame.midX, y: frame.midY)
        quitButtonSprite?.zPosition = 2
        
        addChild(quitButtonSprite!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
