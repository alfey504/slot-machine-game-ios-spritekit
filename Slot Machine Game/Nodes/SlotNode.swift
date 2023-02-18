//
//  SlotNode.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-20.
//

import Foundation
import SpriteKit

// For showing the slots in the slot machine
class SlotNode: SKNode{
    
    private var slotReel1: SlotReelNode?
    private var slotReel2: SlotReelNode?
    private var slotReel3: SlotReelNode?
    private var slotReel4: SlotReelNode?
    private var slotReel5: SlotReelNode?
    
    weak var reelDelegate: SpinReelDelegate?
    
    private var slotBackdrop: SKSpriteNode?
    
    private var slotReelNodes: Array<SlotReelNode>?
    
    init(reelDelegate: SpinReelDelegate) {
        super.init()
        
        // backdrop of the node
        slotBackdrop = SKSpriteNode(imageNamed: "slot-backdrop")
        slotBackdrop?.size = CGSize(width: 350, height: 140)
        slotBackdrop?.zPosition = -1
        
        
        // adding all the slot reels
        let slotReelYOffset: CGFloat = 3.0
        slotReel1 = SlotReelNode(offset: slotReelYOffset)
        let slotReelXOffset = (slotReel1!.size!.width/2) + 15.0
        let slotReelXOffset2 = 22.5 
        print(slotReelXOffset)
        slotReel1?.position = CGPoint(x:  slotBackdrop!.frame.minX  + slotReelXOffset, y: frame.midY + 3)
        slotReel1?.zPosition = 2
        slotReel1?.delegate = reelDelegate
        slotReel1?.nodeId = 1
        
        slotReel2 = SlotReelNode(offset: slotReelYOffset)
        slotReel2?.position = CGPoint(x: slotReel1!.frame.midX + slotReelXOffset * 2 - slotReelXOffset2, y: frame.midY + 3)
        print(slotReel1!.frame.midX)
        slotReel2?.zPosition = 2
        slotReel2?.delegate = reelDelegate
        slotReel2?.nodeId = 2
        
        slotReel3 = SlotReelNode(offset: slotReelYOffset)
        slotReel3?.position = CGPoint(x: slotReel2!.frame.midX + slotReelXOffset * 2 - slotReelXOffset2, y: frame.midY + 3)
        print(slotReel1!.frame.midX)
        slotReel3?.zPosition = 2
        slotReel3?.delegate = reelDelegate
        slotReel3?.nodeId = 3
        
        slotBackdrop?.addChild(slotReel1!)
        slotBackdrop?.addChild(slotReel2!)
        slotBackdrop?.addChild(slotReel3!)
        addChild(slotBackdrop!)
    }
    
    // animates all the slot according to given array
    func animateSlotTo(predictions: Array<Int>){
        slotReel1?.moveSlotTo(number: predictions[0])
        slotReel2?.moveSlotTo(number: predictions[1])
        slotReel3?.moveSlotTo(number: predictions[2])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
