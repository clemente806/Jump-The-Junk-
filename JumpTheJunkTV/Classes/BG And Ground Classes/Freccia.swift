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
        
        self.position.x = -900.0
        self.position.y = 425.0
        statusFreccia = 18.0
    }
    
    func moveTo(status: Double){
        if statusFreccia! < status{
            statusFreccia! += 1.0
            self.position.x += 20
//            AFFIUNGERE IF DI CONTROLLO
        }
        else if statusFreccia! > status{
            statusFreccia! -= 1.0
            self.position.x -= 20
        }
        else {return}
    }

}
