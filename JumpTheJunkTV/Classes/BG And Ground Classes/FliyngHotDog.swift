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
    private var step : CGFloat = 2000
    
    
    func initializeHotDog(camera: SKCameraNode) {
        let fh = self.name
        switch fh {
        case "fliynghotdog1":
            step *= 0
        case "fliynghotdog2":
            step *= 1
        case "fliynghotdog3":
            step *= 2
        case "fliynghotdog4":
            step *= 3
        case "fliynghotdog5":
            step *= 4
        case "fliynghotdog6":
            step *= 5
        case "fliynghotdog7":
            step *= 6
        case "fliynghotdog8":
            step *= 7
        case "fliynghotdog9":
            step *= 8
        default:
            step *= 9
        }
        HotDogAnimation.removeAll()
        for i in 1...4 {
            let name = "hotdog\(i)";
            HotDogAnimation.append(SKTexture(imageNamed: name));
        }
        
        animateHotDogAction = SKAction.animate(with: HotDogAnimation, timePerFrame: 0.07, resize: true, restore: false);
        
        self.run(SKAction.repeatForever(animateHotDogAction))
        
        self.position.x = camera.position.x + 150 + step
        self.position.y = camera.position.y
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: camera.position.x + step, y: camera.position.y))
        path.addCurve(to: CGPoint(x: camera.position.x-200 + step, y: 0),
                      controlPoint1: CGPoint(x: camera.position.x+500, y: CGFloat.random(in: -540...0)), controlPoint2: CGPoint(x: camera.position.x-500, y: CGFloat.random(in: -540...0)))
        path.addLine(to: CGPoint(x:-2000, y: CGFloat.random(in: -540...0)))
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, speed: 500)
        //        let sequence = SKAction.sequence([movement, SKAction.removeFromParent()])
        run(movement)
        
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
