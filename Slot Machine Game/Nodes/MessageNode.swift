//
//  File.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-22.
//

import Foundation
import SpriteKit

class MessageNode: SKNode{
    
    weak var delegate: MessageNodeDelegate?
    
    private var backgroundNode: SKSpriteNode?
    private var emoticonNode: SKSpriteNode?
    private var headerNode: SKLabelNode?
    private var messageNode: SKLabelNode?
    private var message2Node: SKLabelNode?
    
    // enableing user interaction on the node
    override var isUserInteractionEnabled: Bool {
           set {
               // ignore
           }
           get {
               return true
           }
    }
    
    
    init(emoticon: SKTexture, header: String, message: String, message2: String) {
        super.init()
        
        // backdrop of the node
        backgroundNode = SKSpriteNode(imageNamed: "message-backdrop")
        backgroundNode?.size = CGSize(width: 350, height: 450)
        backgroundNode?.position = CGPoint(x: frame.midX, y: frame.midY)
        
        // emoticon for the node
        let emoticonSize = CGSize(width: 150.0, height: 100.0)
        emoticonNode = SKSpriteNode(texture: emoticon, size: emoticonSize)
        let emoticonNodeYOffset = 150.0
        emoticonNode?.position = CGPoint(x: frame.midX, y: frame.midY + emoticonNodeYOffset)
        emoticonNode?.zPosition = 10
        
        // heading for the message
        headerNode = SKLabelNode()
        headerNode?.text = header
        headerNode?.fontName = "Rye-Regular"
        headerNode?.fontSize = 40
        headerNode?.fontColor = .black
        let headerNodeYOffset = 40.0
        headerNode?.position = CGPoint(x: frame.midX, y: frame.midY + headerNodeYOffset)
        headerNode?.zPosition = 10
        
        // message for the message node
        messageNode = SKLabelNode()
        messageNode?.text = message
        messageNode?.fontName = "Rye-Regular"
        messageNode?.fontSize = 20
        messageNode?.fontColor = .black
        let messageNodeYOffset = 0.0
        messageNode?.position = CGPoint(x: frame.midX, y: frame.midY + messageNodeYOffset)
        messageNode?.zPosition = 10
        
        // second line message node
        message2Node = SKLabelNode()
        message2Node?.text = message2
        message2Node?.fontName = "Rye-Regular"
        message2Node?.fontSize = 20
        message2Node?.fontColor = .black
        let message2NodeYOffset = -40.0
        message2Node?.position = CGPoint(x: frame.midX, y: frame.midY + message2NodeYOffset)
        message2Node?.zPosition = 10
        
        addChild(backgroundNode!)
        addChild(emoticonNode!)
        addChild(headerNode!)
        addChild(messageNode!)
        addChild(message2Node!)
    }
    
    // when user touches the node
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(delegate != nil){
            delegate?.messageClosed()
        }
        removeFromParent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
