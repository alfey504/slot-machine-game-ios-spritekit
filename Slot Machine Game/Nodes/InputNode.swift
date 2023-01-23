//
//  InputNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-20.
//

import Foundation
import SpriteKit

// For getting intputs
// (note:- The input control itself is UITextField showed on top of the GameScene)
class InputNode: SKNode{
    
    private var backdropNode: SKSpriteNode?
    private var labelNode: SKLabelNode?
    
    override init(){
        super.init()
        
        // backdrop of the node
        backdropNode = SKSpriteNode(imageNamed: "slot-backdrop")
        backdropNode?.size = CGSize(width: 360.0, height: 70.0)
        backdropNode?.position = CGPoint(x: frame.midX, y: frame.midY)
        backdropNode?.zPosition = -1
        
        // title for the input
        labelNode = SKLabelNode()
        labelNode?.text = "BET"
        labelNode?.fontName = "CuteFont-Regular"
        labelNode?.fontSize = 28
        labelNode?.fontColor = UIColor(red: 21.0/255.0, green: 32.0/255.0, blue: 62.0/255.0, alpha: 1.0)
        let labelNodeYoffset = 12.0
        labelNode?.position = CGPoint(x: frame.midX, y: frame.midY + labelNodeYoffset)
        labelNode?.zPosition = 1
        
        addChild(backdropNode!)
        addChild(labelNode!)
        
    }
    
    // seting the title
    func setLabel(label: String){
        labelNode?.text = label
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
