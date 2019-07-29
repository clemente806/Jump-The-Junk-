//
//  ButtonNode.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 28/06/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import UIKit
import SpriteKit

class ButtonNode: SKSpriteNode {
    
    var focusedImage: SKTexture!
    var unfocusedImage: SKTexture!
    
    
    override var canBecomeFocused: Bool {
        return true
    }
    
    func setFocusedImage(named name: String) {
        focusedImage = SKTexture(imageNamed: name)
        unfocusedImage = self.texture
        isUserInteractionEnabled = true
    }
    
    func didGainFocus() {
        texture = focusedImage
    }
    
    func didLoseFocus() {
        texture = unfocusedImage
    }
    
}
