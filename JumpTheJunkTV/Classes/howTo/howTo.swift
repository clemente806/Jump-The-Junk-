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
        
        let bh = SKSpriteNode(imageNamed: "blackHole")
        bh.position = CGPoint(x:1400, y:30)
        bh.zPosition = 2
        bh.size = CGSize(width: 200, height: 100)
        addChild(bh)
        
        
        let l13 = SKLabelNode(text: "<< Touch the pad to go back <<")
        l13.position = CGPoint(x: 500, y: 20)
        l13.zPosition = 5
        l13.fontName = "Monaco"
        l13.fontColor = UIColor(displayP3Red: 0, green: 200, blue: 255, alpha: 100)
        addChild(l13)
        
        
        let l1 = SKLabelNode(text: "Run from Mr.Fridgerious!")
        l1.position = CGPoint(x: 470, y: 500)
        l1.zPosition = 5
        l1.fontName = "Monaco"
        l1.fontColor = UIColor(displayP3Red: 200, green: 190, blue: 0, alpha: 100)
        addChild(l1)
        let l2 = SKLabelNode(text: "He wants to eat you!")
        l2.position = CGPoint(x: 470, y: 465)
        l2.zPosition = 5
        l2.fontName = "Monaco"
        l2.fontColor = UIColor(displayP3Red: 200, green: 255, blue: 0, alpha: 100)
        addChild(l2)
        let l14 = SKLabelNode(text: "Move the remote upward and")
        l14.position = CGPoint(x: 470, y: 395)
        l14.zPosition = 5
        l14.fontName = "Monaco"
        l14.fontColor = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 100)
        addChild(l14)
        let l15 = SKLabelNode(text: "downward, as fast as you can!!!")
        l15.position = CGPoint(x: 470, y: 360)
        l15.zPosition = 5
        l15.fontName = "Monaco"
        l15.fontColor = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 100)
        addChild(l15)
        
        let l3 = SKLabelNode(text: "YOU")
        l3.position = CGPoint(x: 755, y: 295)
        l3.zPosition = 5
        l3.fontName = "Monaco"
        addChild(l3)
        let ind = SKSpriteNode(imageNamed: "triangolo")
        ind.size = CGSize(width: 20, height: 20)
        ind.zRotation = 3.1415926536
        ind.position = CGPoint(x: 755, y: 275)
        ind.zPosition = 5
        addChild(ind)
        
        
        let l4 = SKLabelNode(text: "You can jump (move to the right the remote)")
        l4.position = CGPoint(x: 1500, y: 200)
        l4.zPosition = 5
        l4.fontName = "Monaco"
        l4.fontColor = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 100)
        addChild(l4)
        let l5 = SKLabelNode(text: " on the platforms to avoid obstacles or junk food")
        l5.position = CGPoint(x: 1500, y: 165)
        l5.zPosition = 5
        l5.fontName = "Monaco"
        l5.fontColor = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 100)
        addChild(l5)
        let ind2 = SKSpriteNode(imageNamed: "triangolo")
        ind2.size = CGSize(width: 20, height: 20)
        ind2.position = CGPoint(x: 1500, y: 250)
        ind2.zPosition = 5
        addChild(ind2)
        
        
        let l6 = SKLabelNode(text: "This is your BMI (Body Mass Index)")
        l6.position = CGPoint(x: 350, y: 850)
        l6.zPosition = 5
        l6.fontName = "Monaco"
        addChild(l6)
        let l7 = SKLabelNode(text: "keep it between 18 and 25 to")
        l7.position = CGPoint(x: 350, y: 815)
        l7.zPosition = 5
        l7.fontName = "Monaco"
        addChild(l7)
        let l8 = SKLabelNode(text: "stay healthy and run faster!")
        l8.position = CGPoint(x: 350, y: 780)
        l8.zPosition = 5
        l8.fontName = "Monaco"
        addChild(l8)
        
        
        let l9 = SKLabelNode(text: "While you keep a good BMI")
        l9.position = CGPoint(x: 1300, y: 850)
        l9.zPosition = 5
        l9.fontName = "Monaco"
        addChild(l9)
        let l10 = SKLabelNode(text: "you will also gain points")
        l10.position = CGPoint(x: 1300, y: 815)
        l10.zPosition = 5
        l10.fontName = "Monaco"
        addChild(l10)
        
        
        let l11 = SKLabelNode(text: "Watch out for Mr.Fridgerious minions!")
        l11.position = CGPoint(x: 1000, y: 665)
        l11.zPosition = 5
        l11.fontName = "Monaco"
        l11.fontColor = UIColor(displayP3Red: 200, green: 190, blue: 0, alpha: 100)
        addChild(l11)
        let l12 = SKLabelNode(text: "They fly following unpredictable trajectories")
        l12.position = CGPoint(x: 1000, y: 630)
        l12.zPosition = 5
        l12.fontName = "Monaco"
        l12.fontColor = UIColor(displayP3Red: 200, green: 190, blue: 0, alpha: 100)
        addChild(l12)
        
        
        let h = SKSpriteNode(imageNamed: "sandwich")
        h.size = CGSize(width: 50, height: 50)
        h.position = CGPoint(x: 1600, y: 100)
        h.zPosition = 5
        addChild(h)
        
        
        let l20 = SKLabelNode(text: "Reach the alarm clock to wake up")
        l20.position = CGPoint(x: 1400, y: 435)
        l20.zPosition = 5
        l20.fontName = "Monaco"
        l20.fontColor = UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 100)
        addChild(l20)
        let l21 = SKLabelNode(text: "and get out of the nightmare!")
        l21.position = CGPoint(x: 1400, y: 400)
        l21.zPosition = 5
        l21.fontName = "Monaco"
        l21.fontColor = UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 100)
        addChild(l21)
        let s = SKSpriteNode(imageNamed: "clock")
        s.size = CGSize(width: 140, height: 200)
        s.position = CGPoint(x: 1730, y: 435)
        s.zPosition = 5
        addChild(s)
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {

        removeAllChildren()
        let game = Intro(fileNamed: "Intro")
        let transition = SKTransition.reveal(with: .up, duration: 1)
        game!.scaleMode = .aspectFill
        view!.presentScene(game!, transition: transition)
        
    }
    
 }
