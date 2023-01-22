//
//  GameScene.swift
//  Slot Machine Game
//
//  Created on 2023-01-20.
//
//  Authors
//  --------------------------------------
//  Abraham Alfred Babu
//  Student ID : 301270598
//
//  Pia Mae Obias
//  Student ID: 301283632
//
//  Satender Yadav
//  Student ID: 301293305
//

import SpriteKit

class GameScene: SKScene, SpinButtonNodeDelegate, MessageNodeDelegate{
    
    private var backgroundNode: BackgroundNode?
    private var jackpotNode: JackpotNode?
    private var slotNode: SlotNode?
    private var creditsNode: InfoNode?
    private var winnerPaidNode: InfoNode?
    private var betNode: InputNode?
    private var betTextField: UITextField?
    private var spinButton: SpinButtonNode?
    private var quitButton: QuitButtonNode?
    private var resetButton: ResetButtonNode?
    private var messageNode: MessageNode?
    
    private var slotMachine: SlotMachine?
    
    init(betTextField: UITextField, view: SKView) {
        super.init(size: view.bounds.size)
        self.betTextField = betTextField
        self.betTextField?.addTarget(self, action: #selector(betChanged(_:)), for: .editingChanged)
        
        slotMachine = SlotMachine()
        //slotMachine?.setSimulateJackpotWin(SIMULATE_JACKPOT_WIN: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func didMove(to view: SKView) {
        
        backgroundNode = BackgroundNode(size: frame.size)
        backgroundNode?.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundNode?.zPosition = -1
        
        jackpotNode = JackpotNode()
        jackpotNode?.setJackpotMoney(money: slotMachine!.jackPot!)
        let jackpotHeightOffset = 240.0
        jackpotNode?.position = CGPoint(x: frame.midX, y: frame.midY + jackpotHeightOffset)
        jackpotNode?.zPosition = 1
        
        slotNode = SlotNode()
        let slotNodeYOffset = 30.0
        slotNode?.position = CGPoint(x: frame.midX, y: frame.midY + slotNodeYOffset)
        slotNode?.zPosition = 1
        
        creditsNode = InfoNode()
        let creditsNodeXOffset = -90.0
        let creditsNodeYOffset = -90.0
        creditsNode?.setTitle(title: "CREDITS")
        creditsNode?.setValue(value: String(slotMachine!.credits!))
        creditsNode?.position = CGPoint(x: frame.midX + creditsNodeXOffset, y: frame.midY + creditsNodeYOffset)
        creditsNode?.zPosition = 1
        
        winnerPaidNode = InfoNode()
        let winnerPaidNodeXOffset = 90.0
        let winnerPaidNodeYOffset = -90.0
        winnerPaidNode?.setTitle(title: "WINNER PAID")
        winnerPaidNode?.setValue(value: String(slotMachine!.winnerPaid!))
        winnerPaidNode?.position = CGPoint(x: frame.midX + winnerPaidNodeXOffset, y: frame.midY + winnerPaidNodeYOffset)
        winnerPaidNode?.zPosition = 1
        
        betNode = InputNode()
        let betNodeYOffset = -185.0
        betNode?.position = CGPoint(x: frame.midX, y: frame.midY + betNodeYOffset)
        betNode?.zPosition = 1
        
        spinButton = SpinButtonNode()
        spinButton?.delegate = self
        let spinButtonYOffset = -300.0
        spinButton?.position = CGPoint(x: frame.midX, y: frame.midY + spinButtonYOffset)
        spinButton?.zPosition = 1
        
        quitButton = QuitButtonNode()
        let quitButtonXOffset = -125.0
        let quitButtonYOffset = -300.0
        quitButton?.position = CGPoint(x: frame.midX + quitButtonXOffset, y: frame.midY + quitButtonYOffset)
        quitButton?.zPosition = 1
        
        resetButton = ResetButtonNode()
        let resetButtonXOffset = 125.0
        let resetButtonYOffset = -300.0
        resetButton?.position = CGPoint(x: frame.midX + resetButtonXOffset, y: frame.midY + resetButtonYOffset)
        resetButton?.zPosition = 1
        
        addChild(backgroundNode!)
        addChild(jackpotNode!)
        addChild(slotNode!)
        addChild(creditsNode!)
        addChild(winnerPaidNode!)
        addChild(betNode!)
        addChild(spinButton!)
        addChild(quitButton!)
        addChild(resetButton!)
    }
    
    func spinButtonPressed() {
        let slotPredictions = Array<Int>([2, 4, 3, 1, 2])
        slotNode?.animateSlotTo(predictions: slotPredictions)
        if(slotMachine!.checkJackpotWin()){
            jackpotIsWon()
        }
    }
    
    func messageClosed() {
        betTextField?.isHidden = false
        let text = betTextField!.text!
        if(slotMachine!.verifyBet(text: text)){
            spinButton?.setEnabled(enabled: true)
        }else{
            spinButton?.setEnabled(enabled: false)
        }
    }
    
    func animationComplete() {
        
    }
    
    func jackpotIsWon(){
        
        betTextField?.isHidden = true
        
        let message = "You have won the jackpot"
        let message2 = "$ " + String(slotMachine!.jackPot!)
        messageNode = MessageNode(emoticon: SKTexture(imageNamed: "jackpot-banner"), header: "Jackpot", message: message, message2: message2)
        messageNode?.position = CGPoint(x: frame.midX, y: frame.midY)
        messageNode?.zPosition = 8
        
        messageNode?.delegate = self
        
        addChild(messageNode!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(betTextField!.isEditing){
            betTextField?.endEditing(true)
        }
    }
    
    
    @objc func betChanged(_ textField: UITextField){
        let text = textField.text!
        
        if(slotMachine!.verifyBet(text: text)){
            spinButton?.setEnabled(enabled: true)
        }else{
            spinButton?.setEnabled(enabled: false)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
