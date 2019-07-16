//
//  ActionNode.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 01/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import UIKit
import SpriteKit


class ActionNode: SKSpriteNode {
    
    var actionImage:SKAction!
    var unfocusedImage: SKTexture!
    var player = SKAction()
    var fitJumpAnimation = [SKTexture]()
    var levelsCompleted = 1
    var label : String!
    private var fitRun = FitRun()
    private var fitRunAnimation = [SKTexture]();
    private var animateFitRunAction = SKAction();
    

    
    override var canBecomeFocused: Bool {
        return true
    }
    
    func setFocusedImage(named name: String) {
        
        unfocusedImage = self.texture

        isUserInteractionEnabled = true
    }
    
//    livelli sbloccati
    func initializeButtonFitRun(){
        
        fitRunAnimation.removeAll()
        name = "FitRun";
        
        for i in 1...12 {
            let name = "fitR\(i)";
            fitRunAnimation.append(SKTexture(imageNamed: name));
        }
        
        animateFitRunAction = SKAction.animate(with: fitRunAnimation, timePerFrame: 0.07, resize: false, restore: false);
        
        
        self.run(SKAction.repeatForever(animateFitRunAction));
        
    }
//  Livelli bloccati
    func initializeButtonFitRunBlock(){
        
        fitRunAnimation.removeAll()
        name = "FitRun";
        
        for i in 1...12 {
            let name = "fitRB\(i)";
            fitRunAnimation.append(SKTexture(imageNamed: name));
        }
        
        animateFitRunAction = SKAction.animate(with: fitRunAnimation, timePerFrame: 0.07, resize: false, restore: true);
        
        self.run(SKAction.repeatForever(animateFitRunAction));
        
    }
    
//    Restart livello
    func initializeButtonRestart(){
        
        fitRunAnimation.removeAll()
        name = "FitRun";
        
        for i in 1...12 {
            let name = "fitRB\(i)";
            fitRunAnimation.append(SKTexture(imageNamed: name));
        }
        
        animateFitRunAction = SKAction.animate(with: fitRunAnimation, timePerFrame: 0.07, resize: false, restore: true);
        
        self.run(SKAction.repeatForever(animateFitRunAction));
        
    }
    
    func didGainFocus() {
        if levelsCompleted == Int(self.label){
            initializeButtonFitRun()
        }
        else {
            initializeButtonFitRunBlock()
        }
    }
    
    func didLoseFocus() {
        removeAllActions()
        texture = unfocusedImage
    }
    
}


