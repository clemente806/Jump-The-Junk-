//
//  cloud.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 10/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import SpriteKit


class cloud: SKSpriteNode {
    func moveCloudlLento(){
        self.position.x += 7;
    }
    
    func moveCloudVeloce(){
        self.position.x += 5;
    }
}
    

