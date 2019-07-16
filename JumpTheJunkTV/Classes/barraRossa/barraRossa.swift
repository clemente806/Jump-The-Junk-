//
//  barraRossa.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 10/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import SpriteKit


class barraRossa: SKSpriteNode {
    
    
    func initializeBarra(){
    
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height))
        physicsBody?.affectedByGravity = false;
        physicsBody?.isDynamic = false;
        physicsBody?.categoryBitMask = ColliderType.BARRAROSSA
        
    
    }
}
