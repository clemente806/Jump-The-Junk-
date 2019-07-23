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

    
    func initializeHotDog(camera: SKCameraNode) {
        
        HotDogAnimation.removeAll()
        name = "fliynghotdog";
        
        for i in 1...4 {
            let name = "hotdog\(i)";
            HotDogAnimation.append(SKTexture(imageNamed: name));
        }
        
        animateHotDogAction = SKAction.animate(with: HotDogAnimation, timePerFrame: 0.07, resize: true, restore: false);
        
        self.run(SKAction.repeatForever(animateHotDogAction))
        
        self.position.x = camera.position.x + 750
        self.position.y = camera.position.y
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: camera.position.x + 700, y: camera.position.y))
        path.addCurve(to: CGPoint(x: camera.position.x - 1400, y: 50), controlPoint1: CGPoint(x: camera.position.x+500, y: 1200), controlPoint2: CGPoint(x: camera.position.x, y: -800))
        
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, speed: 500)
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
