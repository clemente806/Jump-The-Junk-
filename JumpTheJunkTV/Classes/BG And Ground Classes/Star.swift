//
//  star.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 19/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import SpriteKit

class Star: SKSpriteNode {
    
    private var StarAnimation = [SKTexture]();
    private var animateStarAction = SKAction();
    
    func initializeStar() {
        for i in 1...11 {
            let name = "star\(i)";
            StarAnimation.append(SKTexture(imageNamed: name));
        }
        
        animateStarAction = SKAction.animate(with: StarAnimation, timePerFrame: 0.1, resize: false, restore: false);
        
        
        self.run(SKAction.repeatForever(animateStarAction))
    }
    

}
