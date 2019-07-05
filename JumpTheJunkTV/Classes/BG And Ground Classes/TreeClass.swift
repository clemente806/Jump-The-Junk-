//
//  Tree.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 07/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit

class TreeClass: SKSpriteNode {
    func moveTree(camera: SKCameraNode){
        print("funzione tree");
        if self.position.x + self.size.width < camera.position.x {
            self.position.x += self.size.width * 3;
        }
    }
}


