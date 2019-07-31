//
//  Scene1.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 08/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit
import GameplayKit

class Scene1: SKScene{
    
    let livel1 = ActionNode(imageNamed: "1")
    let livel2 = ActionNode(imageNamed: "2")
    let livel3 = ActionNode(imageNamed: "3")
    let livel4 = ActionNode(imageNamed: "4")
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
        
        livel2.label = "2"
        livel2.setFocusedImage(named: "2")
        livel2.position = CGPoint(x: 1125, y: 700)
        livel2.size = CGSize(width: 200, height: 200)
        addChild(livel2)
        
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
                GameViewController.playSoundButtonPress()
                GameViewController.playSoundLevel1()
                let game = Scene1(fileNamed: "Scene1")
                game!.scaleMode = .aspectFill
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game!, transition: transition)
            }
            else if selected === livel3 {
                GameViewController.playSoundButtonPress()
                GameViewController.playSoundLevel1()
                let game = Scene1(fileNamed: "Scene1")
                game!.scaleMode = .aspectFill
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game!, transition: transition)
            }
            else if selected === livel4 {
                GameViewController.playSoundButtonPress()
                GameViewController.playSoundLevel1()
                let game = Scene1(fileNamed: "Scene1")
                game!.scaleMode = .aspectFill
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game!, transition: transition)
            }
        }
    }
}
