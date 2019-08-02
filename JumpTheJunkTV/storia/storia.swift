 //
//  Created by Clemente Piscitelli on 31/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import GameplayKit

class storia: SKScene{
    //    var cont : SKSpriteNode?
    let l1 = SKLabelNode(text: "Touch the pad to continue")
    
    override func didMove(to view: SKView) {
        l1.position = CGPoint(x: 0, y: -500)
        l1.zPosition = 5
        l1.fontName = "Chalkduster"
        l1.fontSize = 40
        l1.fontColor = UIColor(displayP3Red: 0, green: 200, blue: 255, alpha: 100)
        addChild(l1)
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        
        switch self.name {
            
        case "storia1":
            let gameScene = storia(fileNamed: "storia2.sks")
            view!.presentScene(gameScene!,transition: SKTransition.fade(withDuration: TimeInterval(1)))
            //                break
            
            
        case "storia2":
            let gameScene = storia(fileNamed: "storia3.sks")
            view!.presentScene(gameScene!,transition: SKTransition.fade(withDuration: TimeInterval(1)))
            //                break
            
            
        case "storia3":
            let gameScene = storia(fileNamed: "storia4.sks")
            view!.presentScene(gameScene!,transition: SKTransition.fade(withDuration: TimeInterval(1)))
            //                break
            
            
        case "storia4":
            let gameScene = storia(fileNamed: "storia5.sks")
            view!.presentScene(gameScene!,transition: SKTransition.fade(withDuration: TimeInterval(1)))
            //                break
            
            
        default:
            let scene = Intro(fileNamed: "Intro")
            view!.presentScene(scene!,transition: SKTransition.fade(withDuration: TimeInterval(1)))
        }
    }
}
