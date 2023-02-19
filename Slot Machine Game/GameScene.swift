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

class GameScene:
    SKScene,
    SpinButtonNodeDelegate,
    MessageNodeDelegate,
    ResetButtonDelegate,
    SpinReelDelegate
{
    
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
    
    private var messageStack: Array<Int>?
    
    private var reelsAnimating: Array<Bool> = [false, false, false]
    
    var slotMachineResult: SlotSpinResult?
    
    init(betTextField: UITextField, view: SKView) {
        super.init(size: view.bounds.size)
        self.betTextField = betTextField
        self.betTextField?.addTarget(self, action: #selector(betChanged(_:)), for: .editingChanged)
        
        slotMachine = SlotMachine()
        slotMachine?.loadData()
        messageStack = []
//        slotMachine?.setSimulateJackpotWin(SIMULATE_JACKPOT_WIN: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func didMove(to view: SKView) {
        
        // adding background node
        backgroundNode = BackgroundNode(size: frame.size)
        backgroundNode?.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundNode?.zPosition = -1
        
        // adding the jackpot node
        jackpotNode = JackpotNode()
        jackpotNode?.setJackpotMoney(money: slotMachine!.getJackpot())
        let jackpotHeightOffset = 240.0
        jackpotNode?.position = CGPoint(x: frame.midX, y: frame.midY + jackpotHeightOffset)
        jackpotNode?.zPosition = 1
        
        // adding the slot node
        slotNode = SlotNode(reelDelegate: self)
        let slotNodeYOffset = 30.0
        slotNode?.position = CGPoint(x: frame.midX, y: frame.midY + slotNodeYOffset)
        slotNode?.zPosition = 1
        slotNode?.reelDelegate = self
        
        // adding the info node
        creditsNode = InfoNode()
        let creditsNodeXOffset = -90.0
        let creditsNodeYOffset = -90.0
        creditsNode?.setTitle(title: "CREDITS")
        creditsNode?.setValue(value: String(slotMachine!.credits!))
        creditsNode?.position = CGPoint(x: frame.midX + creditsNodeXOffset, y: frame.midY + creditsNodeYOffset)
        creditsNode?.zPosition = 1
        
        // adding the winner paid info node
        winnerPaidNode = InfoNode()
        let winnerPaidNodeXOffset = 90.0
        let winnerPaidNodeYOffset = -90.0
        winnerPaidNode?.setTitle(title: "HIGHEST PAYOUT")
        winnerPaidNode?.setValue(value: String(slotMachine!.getHighestPayout()))
        winnerPaidNode?.position = CGPoint(x: frame.midX + winnerPaidNodeXOffset, y: frame.midY + winnerPaidNodeYOffset)
        winnerPaidNode?.zPosition = 1
        
        // adding the bet input node
        betNode = InputNode()
        let betNodeYOffset = -185.0
        betNode?.position = CGPoint(x: frame.midX, y: frame.midY + betNodeYOffset)
        betNode?.zPosition = 1
        
        // adding the spin button
        spinButton = SpinButtonNode()
        spinButton?.delegate = self
        let spinButtonYOffset = -300.0
        spinButton?.position = CGPoint(x: frame.midX, y: frame.midY + spinButtonYOffset)
        spinButton?.zPosition = 1
        
        // adding the quit button
        quitButton = QuitButtonNode()
        let quitButtonXOffset = -125.0
        let quitButtonYOffset = -300.0
        quitButton?.position = CGPoint(x: frame.midX + quitButtonXOffset, y: frame.midY + quitButtonYOffset)
        quitButton?.zPosition = 1
        
        // adding the reset button
        resetButton = ResetButtonNode()
        let resetButtonXOffset = 125.0
        let resetButtonYOffset = -300.0
        resetButton?.position = CGPoint(x: frame.midX + resetButtonXOffset, y: frame.midY + resetButtonYOffset)
        resetButton?.zPosition = 1
        resetButton?.delegate = self
        
        // adding all the nodes to the scene
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
    
    // when the spin button is pressed
    func spinButtonPressed() {
        let bet = Float(betTextField!.text!) ?? 0.0
        slotMachine!.setBet(bet: bet)
        updateInfoFields()
        
        spinButton?.setEnabled(enabled: false)
        
        slotMachineResult = slotMachine!.spinSlot()
        slotNode?.animateSlotTo(predictions: slotMachineResult!.spinOutCome)
        
        betTextField!.text = ""
    }
    
    // functions to perform in the UI if there is a win
    func spinWin(result: SlotSpinResult){
        betTextField?.isHidden = true
        
        showMessage(
            message: "You have won",
            message2: "$ " + String(result.winAmount),
            messageImage: "win",
            messageHeader: "Win")
        
        updateInfoFields()
        
    }
    
    // shows message node with given message strings
    func showMessage(
        message: String,
        message2: String,
        messageImage: String,
        messageHeader: String,
        zPosition: CGFloat = 20
    ){
        spinButton?.setEnabled(enabled: false)
        messageNode = MessageNode(
            emoticon: SKTexture(imageNamed: messageImage),
            header: messageHeader,
            message: message,
            message2: message2)
        
        messageNode?.position = CGPoint(x: frame.midX, y: frame.midY)
        messageNode?.zPosition = zPosition
        
        messageNode?.delegate = self
        
        messageStack?.append(1)
        addChild(messageNode!)
    }
    
    // fucntions to perform when the spin was a lose
    func spinLost(result: SlotSpinResult){
        
        betTextField?.isHidden = true
        showMessage(
            message: "You have lost",
            message2: "$ " + String(result.winAmount),
            messageImage: "loss",
            messageHeader: "Loss")
        
        updateInfoFields()
    }
    
    // when message is closed
    func messageClosed() {
        let _ = messageStack?.popLast()
        if(messageStack?.count == 0){
            betTextField?.isHidden = false
            let text = betTextField!.text!
            if(slotMachine!.verifyBet(text: text)){
                spinButton?.setEnabled(enabled: true)
            }else{
                spinButton?.setEnabled(enabled: false)
            }
        }
    }
    
    // when  the jackpot is won
    func jackpotIsWon(){
        
        let jackpotMoney = slotMachine?.jacKpotWin()
        
        showMessage(
            message: "You have won the jackpot",
            message2: "$ " + String(jackpotMoney!),
            messageImage: "jackpot-banner",
            messageHeader: "Jackpot",
            zPosition: 100)
        
        updateInfoFields()
    
    }
    
    func isReelAnimationComplete(reels: Array<Bool>) -> Bool{
        for i in reelsAnimating{
            if(!i){
                return false
            }
        }
        return true
    }
    
    func animationCompleteOnReelNode(id: Int) {
        reelsAnimating[id-1] = true
        
        if(isReelAnimationComplete(reels: reelsAnimating)){
            let wait:Double = 1
            DispatchQueue.global(qos: .userInitiated).async {
                Thread.sleep(forTimeInterval: wait)
                DispatchQueue.main.async {
                    self.animationComplete()
                }
            }
        }
        
    }
    
    func resetReelsAnimating(){
        reelsAnimating = [false, false, false]
    }
    
    func animationComplete() {
        
        resetReelsAnimating()
        
        if(slotMachineResult!.win!){
            spinWin(result: slotMachineResult!)
            if(slotMachine!.checkJackpotWin()){
                jackpotIsWon()
            }
        }else{
            spinLost(result: slotMachineResult!)
        }
    }
    
    // to dismiss the keyboard after entering bet
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(betTextField!.isEditing){
            betTextField?.endEditing(true)
        }
    }
    
    // when there is a chnage in bet entry
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
    
    func updateInfoFields(){
        creditsNode?.setValue(value: String(slotMachine!.credits!))
        winnerPaidNode?.setValue(value: String(slotMachine!.getHighestPayout()))
        jackpotNode?.setJackpotMoney(money: slotMachine!.getJackpot())
    }
    
    func resetButtonPressed() {
        slotMachine?.reset()
        betTextField?.text = ""
        updateInfoFields()
    }
    
}
