//
//  GameViewController.swift
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

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    let helpScreenSegueIdentifier: String = "gotToHelpScreen"

    @IBOutlet weak var betTextField: UITextField!
    @IBOutlet weak var helpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            let scene = GameScene(betTextField: betTextField, view: view)
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    }
    
    @IBAction func helpButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: helpScreenSegueIdentifier, sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
