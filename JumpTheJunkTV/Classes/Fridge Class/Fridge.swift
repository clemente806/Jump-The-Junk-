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
    
    func initializeFridge(){
        print("11")
        timerForward = Timer(timeInterval: 0.1, target: self, selector: #selector(moveForward), userInfo: nil, repeats: true)
        print("12")

        timerBackward = Timer(timeInterval: 0.1, target: self, selector: #selector(moveBackward), userInfo: nil, repeats: true)
    }
    
    @objc func moveForward() {
        print("13")

        self.position.y += 0.5
        self.position.x += 0.5
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
        print("14")

        self.position.y -= 0.5
        self.position.x -= 0.5
        self.timerBackwardCounter += 1
        //        print("Backward \(self.timerBackwardCounter)")
        if self.timerBackwardCounter == 20 {
            self.timerBackward.invalidate()
            self.timerBackwardCounter = 0
            self.fridgeStatus = "Avanti"
            self.animation(camera: nil)
        }
    }
    
    func animation(camera: SKCameraNode?){
        if fridgeStatus == "Avanti", timerForwardCounter == 0 {
            RunLoop.current.add(timerForward, forMode: .common)
            //            for _ in 0...10{
            //                self.position.y += 1
            //                self.position.x += 1
            //            }
            //            fridgeStatus = "Indietro"
        } else if fridgeStatus == "Indietro", timerBackwardCounter == 0 {
            RunLoop.current.add(timerBackward, forMode: .common)
            //            for _ in 0...10{
            //                self.position.x -= 1
            //                self.position.y -= 1
            //            }
            //            fridgeStatus = "Avanti"
        }
    }
    
}
