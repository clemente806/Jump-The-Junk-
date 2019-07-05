//
//  livello1.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 03/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import SpriteKit
import AVFoundation


class livel1: SKScene, SKPhysicsContactDelegate{
    
    //var musicBackground: SKAudioNode!
    
    var backgroundMusic: SKAudioNode!
    
    var player: AVAudioPlayer?
    
    private var bg1: BGClass?;
    private var bg2: BGClass?;
    private var bg3: BGClass?;
    
    private var ground1: GroundClass?;
    private var ground2: GroundClass?;
    private var ground3: GroundClass?;
    
    private var tree1: TreeClass?;
    private var tree2: TreeClass?;
    private var tree3: TreeClass?;
    
    private var fitRun: FitRun?;
    
    private var fridge1: Fridge?;
    private var fridge2: Fridge?;
    
    private var mainCamera: SKCameraNode?;
    private var secondCamera: SKCameraNode?;
    
    private var itemController = ItemController();
    
    private var bmiNum: SKLabelNode?;
    private var ScoreNum: SKLabelNode?;
    private var score = 0
    public var status = 20;
    
    var ableToJump = true
    var gameOver = false
    
    
    
}

