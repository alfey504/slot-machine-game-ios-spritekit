//
//  GameScene.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-20.
//

import SpriteKit

class GameScene: SKScene, SpinButtonNodeDelegate{
    
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
    
    private var slotMachine: SlotMachine?
    
    init(betTextField: UITextField, view: SKView) {
        super.init(size: view.bounds.size)
        self.betTextField = betTextField
        self.betTextField?.addTarget(self, action: #selector(betChanged(_:)), for: .editingChanged)
        
        slotMachine = SlotMachine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func didMove(to view: SKView) {
        
        backgroundNode = BackgroundNode(size: frame.size)
        backgroundNode?.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundNode?.zPosition = -1
        
        jackpotNode = JackpotNode()
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
        let slotPredictions = Array<Int>([2, 4, 6, 3, 4])
        slotNode?.animateSlotTo(predictions: slotPredictions)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(betTextField!.isEditing){
            betTextField?.endEditing(true)
        }
    }
    
    @objc func betChanged(_ textField: UITextField){
        let text = textField.text!
        
        if(text == ""){
            spinButton?.setEnabled(enabled: false)
            return
        }
        
        if(text.isNumber()){
            spinButton?.setEnabled(enabled: true)
        }else{
            spinButton?.setEnabled(enabled: false)
            return
        }
        
        guard let bet = Float(text) else{
            spinButton?.setEnabled(enabled: false)
            return
        }
        
        if(slotMachine!.isValidBet(bet: bet)){
            spinButton?.setEnabled(enabled: true)
        }else{
            spinButton?.setEnabled(enabled: false)
            return
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
