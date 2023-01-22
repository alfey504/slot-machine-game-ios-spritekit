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
    
    var size: CGSize?
    var borders: CGPoint?
    
    init(offset: CGFloat){
        super.init()
        
        let backdropColor = UIColor(red: 21.0/255.0, green: 32.0/255.0, blue: 62.0/255.0, alpha: 1.0)
        let backdropSize = CGSize(width: 58, height: 75)
        reelBackdrop = SKSpriteNode(color: backdropColor, size: backdropSize)
        reelBackdrop?.position = CGPoint(x: frame.midX, y: frame.midY)
        reelBackdrop?.zPosition = -1
        
        numberLabel = SKLabelNode()
        numberLabel?.text = "7"
        numberLabel?.fontSize = 42
        numberLabel?.fontColor = .white
        numberLabel?.fontName = "Rye-Regular"
        numberLabel?.position = CGPoint(x: frame.midX, y: frame.midY - 15.0)
        numberLabel?.zPosition = 1
        
        size = reelBackdrop?.size
        borders = CGPoint(x: reelBackdrop!.frame.maxX, y: reelBackdrop!.frame.maxY)
        
        addChild(reelBackdrop!)
        addChild(numberLabel!)
        
    }
    
    func moveSlotTo(number: Int){
        DispatchQueue.global(qos: .userInitiated).async {
            var wait = 0.02
            for i in 1...20{
                if(i % 2 == 0){
                    wait += 0.05
                }
                Thread.sleep(forTimeInterval: wait)
                DispatchQueue.main.async {
                    let randomNumber = Int.random(in: 0...7)
                    self.setSlotValue(number: randomNumber)
                }
            }
            Thread.sleep(forTimeInterval: wait)
            DispatchQueue.main.async {
                self.setSlotValue(number: number)
            }
        }
    }
    
    func setSlotValue(number: Int){
        numberLabel?.text = String(number)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
