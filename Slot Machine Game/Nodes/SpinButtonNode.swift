//
//  SpinButtonNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-21.
//

import Foundation
import SpriteKit

class SpinButtonNode: SKNode{
    
    weak var delegate: SpinButtonNodeDelegate?
    
    private let activeTexture = SKTexture(imageNamed: "spin-button-active")
    private let inactiveTexture = SKTexture(imageNamed: "spin-button-inactive")
    
    private var buttonSprite: SKSpriteNode?
    private var enabled: Bool?
    
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
        
        self.enabled = false
        
        buttonSprite = SKSpriteNode(texture: inactiveTexture)
        buttonSprite?.size = CGSize(width: 125.0, height: 125.0)
        buttonSprite?.position = CGPoint(x: frame.midX, y: frame.midY)
        buttonSprite?.zPosition = 1
        addChild(buttonSprite!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(enabled!){
            if(delegate != nil){
                delegate?.spinButtonPressed()
            }
        }
    }
    
    func setEnabled(enabled: Bool){
        self.enabled = enabled
        if(enabled){
            buttonSprite?.texture = activeTexture
        }else{
            buttonSprite?.texture = inactiveTexture
        }
    }
    
    func isEnabled() -> Bool {
        return enabled!
    }
        
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
