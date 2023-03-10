//
//  ResetButtonNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-21.
//

import Foundation
import SpriteKit

// simple button node
class ResetButtonNode: SKNode{
    
    weak var delegate: ResetButtonDelegate?
    private var quitButtonSprite: SKSpriteNode?
    
    override var isUserInteractionEnabled: Bool {
           set {
               // ignore
           }
           get {
               return true
           }
    }
    
    override init() {
        super.init()
        
        //setting a texture for the button
        quitButtonSprite = SKSpriteNode(imageNamed: "reset-button")
        quitButtonSprite?.size = CGSize(width: 100.0, height: 50.0)
        quitButtonSprite?.position = CGPoint(x: frame.midX, y: frame.midY)
        quitButtonSprite?.zPosition = 2
        
        addChild(quitButtonSprite!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.resetButtonPressed()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
