//
//  Fridge.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 05/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit
import Foundation

class Fridge: SKSpriteNode {
    private var fridgeStatus = "Avanti"
    var timerForward: Timer!
    var timerForwardCounter = 0
    var timerBackward: Timer!
    var timerBackwardCounter = 0
    private var fridgeAnimation = [SKTexture]();
    private var animateFridgeAction = SKAction();
    
    func animateFridge() {
        print("aa")
        fridgeAnimation.removeAll()
        for i in 5...15
        {
            let name = "fridge\(i)";
            fridgeAnimation.append(SKTexture(imageNamed: name));
        }
        
        animateFridgeAction = SKAction.animate(with: fridgeAnimation, timePerFrame: 0.2, resize: false, restore: false);
        
        
        self.run(SKAction.repeatForever(animateFridgeAction))
    }
    
    func initializeFridge(){
        self.animation(camera: nil)
    }
    
    @objc func moveForward() {

        self.position.y += 1.0
        self.position.x += 1.0
        self.timerForwardCounter += 1
        //        print("Forward \(self.timerForwardCounter)")
        if self.timerForwardCounter == 20 /*numero di volte che si ripete il ciclo */ {
            self.timerForward.invalidate()
            self.timerForwardCounter = 0
            self.fridgeStatus = "Indietro"
            self.animation(camera: nil)
        }
    }
    
    @objc func moveBackward() {
        
        self.position.y -= 1.0
        self.position.x -= 1.0
        self.timerBackwardCounter += 1
        //        print("Backward \(self.timerBackwardCounter)")
        if self.timerBackwardCounter == 20 {
            self.timerBackward.invalidate()
            self.timerBackwardCounter = 0
            self.fridgeStatus = "Avanti"
            self.animation(camera: nil)
        }
    }
    
    private func animation(camera: SKCameraNode?){
        if fridgeStatus == "Avanti", timerForwardCounter == 0 {
            timerForward = Timer(timeInterval: 0.1, target: self, selector: #selector(moveForward), userInfo: nil, repeats: true)
            RunLoop.current.add(timerForward, forMode: .common)

        } else if fridgeStatus == "Indietro", timerBackwardCounter == 0 {
            timerBackward = Timer(timeInterval: 0.1, target: self, selector: #selector(moveBackward), userInfo: nil, repeats: true)
            RunLoop.current.add(timerBackward, forMode: .common)

        }
    }
    
}
