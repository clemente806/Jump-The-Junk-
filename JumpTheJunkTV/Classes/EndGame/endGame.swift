//
//  endGame.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 31/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation


class endGame: SKScene {
    
    var player: AVAudioPlayer?
    let restart = ActionNode(imageNamed: "restart")
    let mm = ActionNode(imageNamed: "mainmenu")
    let background = SKSpriteNode(imageNamed: "youdidit")
    var a = String(Int(GameViewController.score))
    
    
    func initializeRestartButton(){
        restart.setFocusedImage(named: "restart")
        restart.position = CGPoint(x: -200, y: -350)
        restart.size = CGSize(width: 200, height: 200)
        addChild(restart)
    }
    func initializeBacktoMenuButton(){
        mm.setFocusedImage(named: "mainmenu")
        mm.position = CGPoint(x: 200, y: -350)
        mm.size = CGSize(width: 200, height: 200)
        addChild(mm)
    }
    override func didMove(to view: SKView) {
        background.zPosition = -1
        background.size = CGSize(width: 1920, height: 1080)
        background.position = CGPoint(x: 0, y:0)
        background.blendMode = .replace
        addChild(background)
        
        
        initializeRestartButton()
        initializeBacktoMenuButton()
        
        let SN = SKLabelNode(text: "Your score: \(a)")
        SN.position = CGPoint(x:0, y: -150)
        SN.fontSize = 90
        SN.zPosition = 5
        SN.fontName = "Monaco"
        SN.fontColor = UIColor(displayP3Red: 0, green: 200, blue: 255, alpha: 100)
        addChild(SN)
        Scene1.blockLivel2 = false
        GameViewController.player!.stop()
        playSoundWinner()
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        
        if let previous = context.previouslyFocusedItem as? ActionNode {
            
            previous.didLoseFocus()
        }
        
        if let next = context.nextFocusedItem as? ActionNode {
            if next == restart{
                next.didGainFocusRestartButton()
            }
            else if next == mm{
                next.didGainFocusBacktoMenuButton()
            }
        }
        
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard let selected = UIScreen.main.focusedItem else { return }
        guard let press = event?.allPresses.first else { return }
        
        if press.type == .select {
            if selected === restart{
//                GameViewController.player!.stop()
                GameViewController.playSoundButtonPress()
                let game = GameplayScene(fileNamed: "GameplayScene")
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game!.scene!, transition: transition)
            }
            else if selected === mm {
//                GameViewController.player!.stop()
                GameViewController.playSoundButtonPress()
                let game = Scene1(fileNamed: "Scene1")
                game!.scaleMode = .aspectFill
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game!.scene!, transition: transition)
                GameViewController.playSoundStoria()
            }
        }
    }
    func playSoundWinner() {
        guard let url = Bundle.main.url(forResource: "winner", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.volume = 3.0
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
