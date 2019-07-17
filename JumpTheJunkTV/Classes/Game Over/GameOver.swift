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
                
                let game = GameplayScene(fileNamed: "GameplayScene")
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game!.scene!, transition: transition)
            }
            else if selected === mm {
                
                let game = Scene1(size: size)
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                view?.presentScene(game.scene!, transition: transition)
            }
        }
    }
    
    //    func pressesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //
    //        for touch in touches{
    //            let location = touch.location(in: self);
    //            if atPoint(location).position == CGPoint(x:480, y:160) {
    //                if let scene = GameplayScene(fileNamed: "GameplayScene") {
    //                    // Set the scale mode to scale to fit the window
    //                    scene.scaleMode = .aspectFill
    //
    //                    // Present the scene
    //                    view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)));
    //                }
    //            }
    //            if atPoint(location).position == CGPoint(x:480, y:-160) {
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
