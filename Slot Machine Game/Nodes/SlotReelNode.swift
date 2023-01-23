//
//  SolotReelNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-20.
//

import Foundation
import SpriteKit

// For showing each reel of a slot
class SlotReelNode: SKNode{
    
    private var reelBackdrop: SKSpriteNode?
//    private var numberLabel: SKLabelNode?
    private var reelItemsTextures: Array<SKTexture>?
    private var reelItem: SKSpriteNode?
    
    var size: CGSize?
    var borders: CGPoint?
    
    init(offset: CGFloat){
        super.init()
        
        // backdrop of the reel
        let backdropColor = UIColor(red: 21.0/255.0, green: 32.0/255.0, blue: 62.0/255.0, alpha: 1.0)
        let backdropSize = CGSize(width: 58, height: 75)
        reelBackdrop = SKSpriteNode(color: backdropColor, size: backdropSize)
        reelBackdrop?.position = CGPoint(x: frame.midX, y: frame.midY)
        reelBackdrop?.zPosition = -1
        
        // setting up all the reel items
        reelItemsTextures = Array<SKTexture>()
        for i in 1...5{
            let texture = SKTexture(imageNamed: String(i))
            reelItemsTextures?.append(texture)
        }
        
        // initializing the reel
        let randomReelItem = Int.random(in: 0...4)
        reelItem = SKSpriteNode(texture: reelItemsTextures![randomReelItem])
        reelItem?.size = CGSize(width: 58.0, height: 58.0)
        reelItem?.position = CGPoint(x: frame.midX, y: frame.midY)
        reelItem?.zPosition = 3
        
//        numberLabel = SKLabelNode()
//        numberLabel?.text = "7"
//        numberLabel?.fontSize = 42
//        numberLabel?.fontColor = .white
//        numberLabel?.fontName = "Rye-Regular"
//        numberLabel?.position = CGPoint(x: frame.midX, y: frame.midY - 15.0)
//        numberLabel?.zPosition = 1
        
        size = reelBackdrop?.size
        borders = CGPoint(x: reelBackdrop!.frame.maxX, y: reelBackdrop!.frame.maxY)
        
        addChild(reelBackdrop!)
//        addChild(numberLabel!)
        addChild(reelItem!)
        
    }
    
    //moves the the reel item to the given item
    func moveSlotTo(number: Int){
        DispatchQueue.global(qos: .userInitiated).async {
            var wait = 0.02
            for i in 1...20{
                if(i % 2 == 0){
                    wait += 0.05
                }
                Thread.sleep(forTimeInterval: wait)
                DispatchQueue.main.async {
                    let randomNumber = Int.random(in: 1...5)
                    self.setSlotValue(number: randomNumber)
                }
            }
            Thread.sleep(forTimeInterval: wait)
            DispatchQueue.main.async {
                self.setSlotValue(number: number)
            }
        }
    }
    
    // sets the item to the slot
    func setSlotValue(number: Int){
        reelItem?.texture = reelItemsTextures![number - 1]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
