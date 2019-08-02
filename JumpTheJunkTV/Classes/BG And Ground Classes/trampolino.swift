//
//  trampolino.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 31/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//
import Foundation
import SpriteKit

class trampolino: SKSpriteNode {
    
    func initializeTrampolino(){
        physicsBody = SKPhysicsBody(rectangleOf: self.size);
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false;
        physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES
//        physicsBody?.applyImpulse(CGVector(dx: 0,dy: 700))
    }
}
