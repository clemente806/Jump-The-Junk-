//
//  FitRun.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 05/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit

struct ColliderType {
    static let PLAYER: UInt32 = 0;
    static let GROUND: UInt32 = 1;
    static let JUNK_AND_COLLECTABLES: UInt32 = 2;
}

class FitRun: SKSpriteNode {
    
    // RUN
    private var fitRunAnimation = [SKTexture]();
    private var animateFitRunAction = SKAction();
    
    
    func initializeFitRun(status : Int) {
        fitRunAnimation.removeAll()
        name = "FitRun";
//        print(ciao)
        if status <= 25{

            for i in 1...12 {
                let name = "fitR\(i)";
                fitRunAnimation.append(SKTexture(imageNamed: name));
                }
        }
        else {
            for i in 1...12 {
                let name1 = "fatR\(i)";
                fitRunAnimation.append(SKTexture(imageNamed: name1));
                }
            }
        
        animateFitRunAction = SKAction.animate(with: fitRunAnimation, timePerFrame: 0.07, resize: true, restore: false);
        
        
        self.run(SKAction.repeatForever(animateFitRunAction));
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 40, height: self.size.height - 10));
        physicsBody?.affectedByGravity = true;
        physicsBody?.allowsRotation = false;
        physicsBody?.restitution = 0;
        physicsBody?.categoryBitMask = ColliderType.PLAYER;
        physicsBody?.collisionBitMask = ColliderType.GROUND;
        physicsBody?.contactTestBitMask = ColliderType.JUNK_AND_COLLECTABLES;
        
    }
    
    func move(status: Int, camera: CGFloat) {
        if status > 25 {
            self.position.x += 12;
        }

            //RECUPERA POSIZIONE INIZIALE
        else if (self.position.x < camera) {
                self.position.x += 14
            
                }
            else {
                self.position.x += 13
            }
    }

} // Class











