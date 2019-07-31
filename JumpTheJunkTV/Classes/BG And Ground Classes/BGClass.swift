//
//  BGClass.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 05/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit

class BGClass: SKSpriteNode {
    func moveBG(camera: SKCameraNode){
        if self.position.x + self.size.width < camera.position.x {
            self.position.x += self.size.width * 3;
        }
    
    }
    
}
