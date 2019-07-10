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
    
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height - 240))
        physicsBody?.affectedByGravity = false;
        physicsBody?.isDynamic = false;
        physicsBody?.categoryBitMask = ColliderType.BARRAROSSA
        
    
    }
//    item = SKSpriteNode(imageNamed: "barraRossa");
//    item?.name = "barraRossa";
//    item?.setScale(0.6);
//    item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size)
//    item?.physicsBody?.categoryBitMask = ColliderType.BARRAROSSA
//    //            item?.physicsBody?.mass = 100
//    //            item?.physicsBody?.isDynamic = false
//    //            item?.physicsBody?.restitution = 0.5
//    //            item?.physicsBody?.mass = 1000
    
}
