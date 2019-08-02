//
//  freccia.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 18/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//
import Foundation
import SpriteKit

class Freccia: SKSpriteNode {
    
    var statusFreccia: Double?
    
    func initializeFreccia(){
        
        self.position.x = -380.0
        self.position.y = 350.0
        statusFreccia = 18.0
    }
    
    func moveTo(status: Double){
        if statusFreccia! < status &&  status >= 18 && status <= 35{
            let myCGFloat = CGFloat(status - statusFreccia!)
            statusFreccia! = status
            if self.position.x >= -380.0 && self.position.x <= 1325.0{
                let pos = self.position.x + (20 * (myCGFloat))
                if pos < 1325.0{

                    self.position.x += 20 * (myCGFloat)
                }
            }
            
            
            //            AFFIUNGERE IF DI CONTROLLO
        }
        else if statusFreccia! > status && status <= 35 && status >= 18{
            let myCGFloat = CGFloat(statusFreccia! - status)
            
            statusFreccia! = status
            
            if self.position.x >= -380.0 && self.position.x <= 1325.0{
                
                let pos = self.position.x - (20 * (myCGFloat))
                if pos > -380.0{
                    self.position.x -= 20 * (myCGFloat)
                }
            }
            
        }
        else {return}
    }
    
}
