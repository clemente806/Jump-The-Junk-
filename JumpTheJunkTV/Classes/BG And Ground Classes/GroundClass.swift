//
//  GroundClass.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 05/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit

class GroundClass: SKSpriteNode {
    
    // Floor si riferisce ai ripiani sul quale il personaggio salterà, aggiunti in un secondo momento.
    
    func initializeGroundAndFloor(){
        physicsBody = SKPhysicsBody(rectangleOf: self.size);
        physicsBody?.affectedByGravity = false;
        physicsBody?.isDynamic = false;
        physicsBody?.categoryBitMask = ColliderType.GROUND;
        
    }
    
    func moveGrounds(camera: SKCameraNode){
        if self.position.x + self.size.width < camera.position.x {
            self.position.x += self.size.width * 3;
        }
    }
    
} // Class











































