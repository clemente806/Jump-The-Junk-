//
//  blackHole.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 29/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import SpriteKit

class blackHole: SKSpriteNode {
    
    func initializeblackHole(){
        physicsBody = SKPhysicsBody(rectangleOf: self.size);
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false;
        physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES
    }
}
