//
//  ufo.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 31/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import SpriteKit


class ufo: SKSpriteNode {
    func moveUfo(camera: SKCameraNode){
//        self.run(SKAction.repeatForever(animateHotDogAction))
        print("AAA")
        self.position.x = camera.position.x + 100750
        self.position.y = camera.position.y
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: camera.position.x+1000, y: 0))
        path.addCurve(to: CGPoint(x: camera.position.x - 300, y: 0), controlPoint1: CGPoint(x: camera.position.x+300, y: 900), controlPoint2: CGPoint(x: camera.position.x, y: -800))
        path.addLine(to: CGPoint(x: camera.position.x-1000,y:1000))
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: false, speed: 500)
        let sequence = SKAction.sequence([movement, SKAction.removeFromParent()])
        run(sequence)
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 40, height: self.size.height - 10))
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
        physicsBody?.restitution = 0
    }
}
