//
//  BackgroundNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-20.
//

import Foundation
import SpriteKit

class BackgroundNode: SKNode {
    
    private let backGroundSprite = SKSpriteNode(imageNamed: "background")
    
    init(size: CGSize) {
        super.init()
        let offset:CGFloat = 20.0
        backGroundSprite.size = CGSize(width: size.width+40, height: size.height)
        backGroundSprite.position = CGPoint(x: frame.midX-offset, y: frame.midY)
        addChild(backGroundSprite)
        zPosition = -1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
