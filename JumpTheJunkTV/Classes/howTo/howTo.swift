//
//  howTo.swift
//  JumpTheJunkTV
//
//  Created by Salvatore Capobianco on 29/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import SpriteKit
import GameplayKit

class howTo: SKScene {
    override func didMove(to view: SKView) {
        
        let bg = SKSpriteNode(imageNamed: "howToBG")
        bg.size = CGSize(width: 1920, height: 1080)
        bg.position = CGPoint(x:960, y: 540)
        bg.blendMode = .replace
        addChild(bg)
       
        
        let l1 = SKLabelNode(text: "Run from Mr.Fridgerious!")
        l1.position = CGPoint(x: 400, y: 500)
        l1.zPosition = 5
        l1.fontName = "Monaco"
        addChild(l1)
        let l2 = SKLabelNode(text: "He wants to eat you!")
        l2.position = CGPoint(x: 400, y: 475)
        l2.zPosition = 5
        l2.fontName = "Monaco"
        addChild(l2)
        
        
        let l3 = SKLabelNode(text: "YOU")
        l3.position = CGPoint(x: 505, y: 190)
        l3.zPosition = 5
        l3.fontName = "Monaco"
        addChild(l3)
        let ind = SKSpriteNode(imageNamed: "triangolo")
        ind.size = CGSize(width: 20, height: 20)
        ind.zRotation = 3.1415926536
        ind.position = CGPoint(x: 505, y: 175)
        ind.zPosition = 5
        addChild(ind)
        
        
        let l4 = SKLabelNode(text: "You can jump over the platforms to avoid")
        l4.position = CGPoint(x: 980, y: 120)
        l4.zPosition = 5
        l4.fontName = "Monaco"
        addChild(l4)
        let l5 = SKLabelNode(text: "obstacles or junk food")
        l5.position = CGPoint(x: 980, y: 95)
        l5.zPosition = 5
        l5.fontName = "Monaco"
        addChild(l5)
        let ind2 = SKSpriteNode(imageNamed: "triangolo")
        ind2.size = CGSize(width: 20, height: 20)
        ind2.position = CGPoint(x: 980, y: 160)
        ind2.zPosition = 5
        addChild(ind2)
        
        
        let l6 = SKLabelNode(text: "This is your BMI (Body Mass Index)")
        l6.position = CGPoint(x: 350, y: 530)
        l6.zPosition = 5
        l6.fontName = "Monaco"
        addChild(l6)
        let l7 = SKLabelNode(text: "keep it between 18-25 to")
        l7.position = CGPoint(x: 350, y: 505)
        l7.zPosition = 5
        l7.fontName = "Monaco"
        addChild(l7)
        let l8 = SKLabelNode(text: "stay healthy and run faster!")
        l8.position = CGPoint(x: 350, y: 480)
        l8.zPosition = 5
        l8.fontName = "Monaco"
        addChild(l8)
        
        
        let l9 = SKLabelNode(text: "While you keep a good BMI")
        l9.position = CGPoint(x: 850, y: 530)
        l9.zPosition = 5
        l9.fontName = "Monaco"
        addChild(l9)
        let l10 = SKLabelNode(text: "you will get points")
        l10.position = CGPoint(x: 850, y: 505)
        l10.zPosition = 5
        l10.fontName = "Monaco"
        addChild(l10)
        
        
        let l11 = SKLabelNode(text: "Watch out for Mr.Fridgeous minions!")
        l11.position = CGPoint(x: 900, y: 350)
        l11.zPosition = 5
        l11.fontName = "Monaco"
        addChild(l11)
        let l12 = SKLabelNode(text: "They fly following unpredictable trajectories")
        l12.position = CGPoint(x: 900, y: 325)
        l12.zPosition = 5
        l12.fontName = "Monaco"
        addChild(l12)
        
        
        let h = SKSpriteNode(imageNamed: "sandwich")
        h.size = CGSize(width: 50, height: 50)
        h.position = CGPoint(x: 1200, y: 75)
        h.zPosition = 5
        addChild(h)
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        let game = Intro(fileNamed: "Intro")
        let transition = SKTransition.reveal(with: .up, duration: 1)
        game!.scaleMode = .aspectFill
        view?.presentScene(game!, transition: transition)
       
    }
}
