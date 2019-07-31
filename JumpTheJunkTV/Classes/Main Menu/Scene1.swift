//
//  Scene1.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 08/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class Scene1: SKScene{
    
    var player: AVAudioPlayer?
    let livel1 = ActionNode(imageNamed: "1")
    var livel2 = ActionNode(imageNamed: "2S")
    let livel3 = ActionNode(imageNamed: "3")
    let livel4 = ActionNode(imageNamed: "4")
    public static var blockLivel2 = true
    
//    private var fitRun = FitRun()
    private var fitRun1 = FitRun()
    
    override func didMove(to view: SKView) {
        GameViewController.playSound()
        let background = SKSpriteNode(imageNamed: "Scene1")
        background.zPosition = -1
        background.position = CGPoint(x: 960, y:540)
        background.blendMode = .replace
        addChild(background)
        
        livel1.label = "1"
        livel1.setFocusedImage(named: "1")
        livel1.position = CGPoint(x: 800, y: 700)
        livel1.size = CGSize(width: 200, height: 200)
        addChild(livel1)
        
        //Se il livello è bloccato
        if(Scene1.blockLivel2 == true){
            livel2.label = "2S"
            livel2.setFocusedImage(named: "2S")
            livel2.position = CGPoint(x: 1125, y: 700)
            livel2.size = CGSize(width: 200, height: 200)
            addChild(livel2)
        }
        //Se il livello è sbloccato
        else if(Scene1.blockLivel2 == false){
            livel2 = ActionNode(imageNamed: "2")
            livel2.label = "2"
            livel2.setFocusedImage(named: "2")
            livel2.position = CGPoint(x: 1125, y: 700)
            livel2.zPosition = 3
            livel2.size = CGSize(width: 200, height: 200)
            addChild(livel2)
        }

        
        livel3.label = "3"
        livel3.setFocusedImage(named: "3")
        livel3.position = CGPoint(x: 800, y: 400)
        livel3.size = CGSize(width: 200, height: 200)
        addChild(livel3)
        
        livel4.label = "4"
        livel4.setFocusedImage(named: "4")
        livel4.position = CGPoint(x: 1125, y: 400)
        livel4.size = CGSize(width: 200, height: 200)
        addChild(livel4)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        
        if let previous = context.previouslyFocusedItem as? ActionNode {
            
            previous.didLoseFocus()
        }
        
        if let next = context.nextFocusedItem as? ActionNode {
            
            next.didGainFocus()
        }
        
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard let selected = UIScreen.main.focusedItem else { return }
        guard let press = event?.allPresses.first else { return }
        
        if press.type == .select {
            if selected === livel1 {
                GameViewController.playSoundButtonPress()
                GameViewController.playSoundLevel1()
                let game = GameplayScene(fileNamed: "GameplayScene")
                game!.scaleMode = .aspectFill

                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene((game?.scene!)!, transition: transition)
            }
                
            else if selected === livel2 {
                if(livel2.label == "2S"){
                    playSoundError()
                }
                //Se il livello si è sbloccato puoi far partire il secondo livello
                else if(livel2.label == "2"){
                    GameViewController.playSoundButtonPress()
                    let game = Scene1(fileNamed: "Scene1")
                    game!.scaleMode = .aspectFill
                    let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                    view?.presentScene(game!, transition: transition)
                }
            }
                
            else if selected === livel3 {
                playSoundError()
            }
                
            else if selected === livel4 {
                playSoundError()
            }
        }
    }
    func playSoundError() {
        guard let url = Bundle.main.url(forResource: "error", withExtension: "wav") else { return }
        
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
