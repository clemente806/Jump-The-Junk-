
//
//  Intro.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 08/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit
import GameplayKit

class Intro: SKScene {
    
    let startNewGame = ButtonNode(imageNamed: "startNewGameLo")
    
    override func didMove(to view: SKView) {
        
//        let background = SKSpriteNode(imageNamed: "intro")
//        background.zPosition = -1
//        background.position = CGPoint(x: 0, y: 50)
//
//        background.blendMode = .replace
//        addChild(background)
        
        startNewGame.setFocusedImage(named: "startNewGameHi")
        startNewGame.position = CGPoint(x: 0, y: -300)
        startNewGame.size = CGSize(width: 350, height: 120)
        startNewGame.zPosition = 1
        addChild(startNewGame)
        
        
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if let previous = context.previouslyFocusedItem as? ButtonNode {
            previous.didLoseFocus()
        }
        
        if let next = context.nextFocusedItem as? ButtonNode {
            next.didGainFocus()
        }
        
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard let selected = UIScreen.main.focusedItem else { return }
        guard let press = event?.allPresses.first else { return }
        
        if press.type == .select {
            if selected === startNewGame {
                
                let game = Scene1(size: size)
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game, transition: transition)
            }
        }
    }
    
    
}
