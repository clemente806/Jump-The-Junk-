//
//  meteora.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 31/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import Foundation
import SpriteKit


class meteora: SKSpriteNode {
    func moveMeteora(){
        self.position.x += 1;
        self.position.y += -1;
}
}
