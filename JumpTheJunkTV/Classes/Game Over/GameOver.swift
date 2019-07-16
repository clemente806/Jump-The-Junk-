//
//  GameOver.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 09/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit
import GameplayKit

let restart = ActionNode(imageNamed: "restart")
let mm = ActionNode(imageNamed: "mainmenu")


class GameOver: SKScene {
    
    let background = SKSpriteNode(imageNamed: "gameover")
    
    
    override func didMove(to view: SKView) {
        
        background.zPosition = -1
        background.position = CGPoint(x: 0, y:0)
        background.blendMode = .replace
        addChild(background)
        
        restart.setFocusedImage(named: "restart")
        restart.position = CGPoint(x: 480, y: 160)
        restart.size = CGSize(width: 165, height: 165)
        addChild(restart)
        
        mm.setFocusedImage(named: "mainmenu")
        mm.position = CGPoint(x: 480, y: -160)
        mm.size = CGSize(width: 165, height: 165)
        addChild(mm)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        
        if let previous = context.previouslyFocusedItem as? ActionNode {
            
            previous.didLoseFocus()
        }
        
        if let next = context.nextFocusedItem as? ActionNode {
            
            next.didGainFocus()
        }
        
    }
    func didLoseFocus(){
        
    }
    func didGainFocus(){
        
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        for touch in touches{
//            let location = touch.location(in: self);
//            if atPoint(location).name == "Restart" {
//                if let scene = GameplayScene(fileNamed: "GameplayScene") {
//                    // Set the scale mode to scale to fit the window
//                    scene.scaleMode = .aspectFill
//
//                    // Present the scene
//                    view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)));
//                }
//            }
//            if atPoint(location).name == "MainMenu" {
//                if let scene = Scene1(fileNamed: "Scene1") {
//                    // Set the scale mode to scale to fit the window
//                    scene.scaleMode = .aspectFill
//
//                    // Present the scene
//                    view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)));
//                }
//            }
//        }
//    }
}
