//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOver: SKScene {
    
    let restart = ActionNode(imageNamed: "restart")
    let mm = ActionNode(imageNamed: "mainmenu")
    let background = SKSpriteNode(imageNamed: "gameover")
    
    func initializeRestartButton(){
        restart.setFocusedImage(named: "restart")
        restart.position = CGPoint(x: 50, y: -140)
        restart.size = CGSize(width: 165, height: 165)
        addChild(restart)
    }
    func initializeBacktoMenuButton(){
        mm.setFocusedImage(named: "mainmenu")
        mm.position = CGPoint(x: 430, y: -140)
        mm.size = CGSize(width: 165, height: 165)
        addChild(mm)
    }
    override func didMove(to view: SKView) {
        GameViewController.playSoundGameOver()
        background.zPosition = -1
        background.size = CGSize(width: 1280, height: 720)
        background.position = CGPoint(x: 0, y:0)
        background.blendMode = .replace
        addChild(background)
        
        initializeRestartButton()
        initializeBacktoMenuButton()
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
                GameViewController.player!.stop()
                GameViewController.playSoundButtonPress()
                let game = GameplayScene(fileNamed: "GameplayScene")
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game!.scene!, transition: transition)
            }
            else if selected === mm {
                GameViewController.player!.stop()
                GameViewController.playSoundButtonPress()
                let game = Scene1(fileNamed: "Scene1")
                game!.scaleMode = .aspectFill
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game!.scene!, transition: transition)
            }
        }
    }
}
