//
//  storia.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 31/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import GameplayKit

class storia: SKScene{
    
    
    var bg : SKSpriteNode?
    var index = 2
//    var cont : SKSpriteNode?
    
    func avanti(image: String) -> SKScene {
        bg = SKSpriteNode(imageNamed: image)
        return self
    }
    
    override func didMove(to view: SKView) {
        
        bg?.size = CGSize(width: 1920, height: 1080)
        bg?.position = CGPoint(x:0, y: 0)
        bg?.zPosition = -1
        
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        
        switch index {
        case 1:
            let scene = self.avanti(image: "storia1")
            index += 1
            scene.scaleMode = .aspectFill
//            view!.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
            addChild(bg!)
        case 2:
            removeAllChildren()
            let scene = self.avanti(image: "storia2")
            index += 1
            scene.scaleMode = .aspectFill
//            view!.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
            addChild(bg!)
        case 3:
            removeAllChildren()
            let scene = self.avanti(image: "storia3")
            index += 1
            scene.scaleMode = .aspectFill
//            view!.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
            addChild(bg!)
        case 4:
            removeAllChildren()
            let scene = self.avanti(image: "storia4")
            index += 1
            scene.scaleMode = .aspectFill
//            view!.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
            addChild(bg!)
        case 5:
            removeAllChildren()
            let scene = self.avanti(image: "storia5")
            index += 1
            scene.scaleMode = .aspectFill
//            view!.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
            addChild(bg!)
        default:

            let scene = Intro(fileNamed: "Intro")
//            scene.scaleMode = .aspectFill
            view!.presentScene(scene!, transition: SKTransition.fade(withDuration: TimeInterval(1)));
        }
    }
}
