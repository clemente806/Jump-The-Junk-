
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
    let howToPlay = ButtonNode(imageNamed: "howToPlayLo")

    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "intro")
        background.zPosition = -1
        background.position = CGPoint(x: 0, y: 0)
        
        background.blendMode = .replace
        addChild(background)
        
        startNewGame.setFocusedImage(named: "startNewGameHi")
        startNewGame.position = CGPoint(x: 0, y: -160)
        startNewGame.size = CGSize(width: 350, height: 120)
        startNewGame.zPosition = 1
        addChild(startNewGame)
        
        howToPlay.setFocusedImage(named: "howToPlayHi")
        howToPlay.position = CGPoint(x: 0, y: -300)
        howToPlay.size = CGSize(width: 350, height: 120)
        howToPlay.zPosition = 1
        addChild(howToPlay)
        
        
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
                GameViewController.playSoundButtonPress()
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game, transition: transition)
            }
            else if selected === howToPlay {
                
                let game = howTo(size: size)
                GameViewController.playSoundButtonPress()
                let transition = SKTransition.reveal(with: .down, duration: 1)
                view?.presentScene(game, transition: transition)
            }
        }
    }
    
    
}
