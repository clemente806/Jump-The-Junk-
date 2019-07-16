//
//  FliyngHotDog.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 15/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import SpriteKit


class fliynghotdog: SKSpriteNode {
    
    private var HotDogAnimation = [SKTexture]();
    private var animateHotDogAction = SKAction();

    
    func initializeHotDog() {
        HotDogAnimation.removeAll()
//        print("volooooooooooooooooooooooooo")
        name = "fliynghotdog";
        
            for i in 1...4 {
                let name = "hotdog\(i)";
                print("cambio")

                HotDogAnimation.append(SKTexture(imageNamed: name));
            }
        
        animateHotDogAction = SKAction.animate(with: HotDogAnimation, timePerFrame: 0.07, resize: true, restore: false);
        
        
        self.run(SKAction.repeatForever(animateHotDogAction))
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 960, y: 320))
        path.addLine(to: CGPoint(x: 700, y: 320))
        
        path.addCurve(to: CGPoint(x: -3500, y: 0), controlPoint1: CGPoint(x: 0, y: -position.y * 6), controlPoint2: CGPoint(x: -1000, y: -position.y))
        
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, speed: 600)
        let sequence = SKAction.sequence([movement, SKAction.removeFromParent()])
        run(sequence)
    

        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 40, height: self.size.height - 10))
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
        physicsBody?.restitution = 0
        physicsBody?.categoryBitMask = ColliderType.PLAYER
        physicsBody?.collisionBitMask = ColliderType.GROUND
        physicsBody?.contactTestBitMask = ColliderType.JUNK_AND_COLLECTABLES
        physicsBody?.categoryBitMask = ColliderType.BARRAROSSA
    }

}
