//
//  InfoNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-20.
//

import Foundation
import SpriteKit

class InfoNode: SKNode {
    
    private var backdropNode: SKSpriteNode?
    private var titleNode: SKLabelNode?
    private var valueNode: SKLabelNode?
    
    override init() {
        super.init()
        
        backdropNode = SKSpriteNode(imageNamed: "slot-backdrop")
        backdropNode?.size = CGSize(width: 175.0, height: 70.0)
        
        titleNode = SKLabelNode()
        titleNode?.text = "CREDITS"
        titleNode?.fontName = "CuteFont-Regular"
        titleNode?.fontSize = 28
        titleNode?.fontColor = UIColor(red: 21.0/255.0, green: 32.0/255.0, blue: 62.0/255.0, alpha: 1.0)
        let titleNodeYOffset = 10.0
        titleNode?.position = CGPoint(x: frame.midX, y: frame.minY + titleNodeYOffset)
        titleNode?.zPosition = 2
        
        valueNode = SKLabelNode()
        valueNode?.text = "$ 1,000"
        valueNode?.fontName = "CuteFont-Regular"
        valueNode?.fontSize = 28
        valueNode?.fontColor = UIColor(red: 21.0/255.0, green: 32.0/255.0, blue: 62.0/255.0, alpha: 1.0)
        let valueNodeYOffset = -16.0
        valueNode?.position = CGPoint(x: frame.midX, y: frame.minY + valueNodeYOffset)
        valueNode?.zPosition = 2
        
        backdropNode?.addChild(titleNode!)
        backdropNode?.addChild(valueNode!)
        addChild(backdropNode!)
        
    }
    
    func setValue(value: String){
        valueNode?.text = value
    }
    
    func setTitle(title: String){
        titleNode?.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
