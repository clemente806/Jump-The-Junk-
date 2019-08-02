//
//  GameplayScene2.swift
//  JumpTheJunkTV
//
//  Created by Clemente Piscitelli on 31/07/2019.
//  Copyright © 2019 Clemente Piscitelli. All rights reserved.
//

import SpriteKit
import AVFoundation
import GameController

class GameplayScene2: SKScene, SKPhysicsContactDelegate {
    
    var ableToJump = true
    
    private var bmiNum: SKLabelNode?
    private var ScoreNum: SKLabelNode?
    
    var score : Float = 0.0 {
        didSet {
            GameViewController.score = score
        }
    }
    
    private var ground1: GroundClass?
    private var ground2: GroundClass?
    private var ground3: GroundClass?
    
    private var meteora1: meteora?
    
    private var ufo1: ufo?
    
    var player: AVAudioPlayer?
    
    private var trampolino1: trampolino?
    var gameOver = false
    
    private var fitRun2: FitRun?
    public var status = 18.0
    
    public var x: CGFloat = 0.000
    public var y: CGFloat = 0.000
    
    private var mainCamera2: SKCameraNode?
    
    override func didMove (to view: SKView) {
        initializeGame()
    }
    
    override func update(_ currentTime: TimeInterval){
        
        if fitRun2?.physicsBody?.velocity.dy == 0{
            ableToJump = true
        }
        else {
            ableToJump = false
        }
        if status >= 18.0 && status <= 25.0 {
            score += 0.1
        }
        ScoreNum?.text = String(Int(score));

        if ((fitRun2?.position.y)! > self.mainCamera2!.position.y+1800){
            gameOver = true
        }
        
        if gameOver {
            gameover()
        }
        
//        if fitRun!.position.x < self.mainCamera!.position.x - (self.scene!.frame.width / 2 - 60) {
//            fitRun?.removeFromParent()
//            gameOver = false
//        }
//        if !gameOver {
//            gameover()
//        }
        physicsWorld.contactDelegate = self
    
          manageCamera()
//        manageSecondCamera()
          manageBGsAndGrounds()
//        cloud1?.moveCloudlLento()
//        cloud2?.moveCloudVeloce()
//        cloud3?.moveCloudVeloce()
//        cloud4?.moveCloudlLento()
        
        //        Controllo caduta del personaggio
//        if ((fitRun?.position.y)! < self.mainCamera!.position.y-2000){
//            gameOver = false
//        }
        fitRun2?.move(status: status, camera: mainCamera2!.position.x, accx: x);
        
        meteora1?.moveMeteora()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        controller?.motion?.valueChangedHandler = {(motion: GCMotion)->() in
//            let y = motion.userAcceleration.y
//
//            var fitJumpAnimation = [SKTexture]();
//            var animateFitJumpAction = SKAction();
//
//            if self.ableToJump == true && y > 1.0 {
//                self.playSoundJump()
//                self.ableToJump = false
//                self.name = "FitJump";
//                if self.status <= 25.0{
//                    self.fitRun?.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 700))
//                    for i in 1...6 {
//                        let name = "fitJ\(i)";
//                        fitJumpAnimation.append(SKTexture(imageNamed: name));
//                    }
//                }
//                else {
//                    self.fitRun?.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 500))
//                    for i in 1...6 {
//                        let name1 = "fatJ\(i)";
//                        fitJumpAnimation.append(SKTexture(imageNamed: name1));
//                    }
//                }
//                animateFitJumpAction = SKAction.animate(with: fitJumpAnimation, timePerFrame: 0.20
//                    , resize: true, restore: false);
//                self.fitRun?.run(SKAction.repeat(animateFitJumpAction, count: 1));
//            }
//        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody();
        var secondBody = SKPhysicsBody();
        
        if contact.bodyA.node?.name == "FitRun"{
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
        }
        else {
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "trampolino1"{
            playSoundSpring()
            fitRun2?.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 2000))
            if (status <= 25)
            {
                fitRun2?.cadutaFit()
            }
            else{
                fitRun2?.cadutaFat()
            }
        }
        //
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "barra1" || secondBody.node?.name == "barra2"  {
        //            firstBody.node?.physicsBody?.collisionBitMask = (secondBody.node?.physicsBody!.collisionBitMask)!
        //        }
        //
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "sveglia1"{
        //            endGamef()
        //        }
        //
        //        // Good food
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "apple" {
        //            playSoundGood()
        //            if status >= 18.6 {
        //                status -= 0.6
        //            }
        //            freccia?.moveTo(status: status)
        //            fitRun?.initializeFitRun(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent()
        //        }
        //
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "banana" {
        //            playSoundGood()
        //            if status >= 18.4 {
        //                status -= 0.4
        //            }
        //            freccia?.moveTo(status: status)
        //            fitRun?.initializeFitRun(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent()
        //        }
        //
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "broccoli" {
        //            playSoundGood()
        //            if status > 19 {
        //                status -= 1.0
        //            }
        //            freccia?.moveTo(status: status)
        //            fitRun?.initializeFitRun(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent()
        //        }
        //
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "carrot" {
        //            playSoundGood()
        //            if status >= 18.8 {
        //                status -= 0.8
        //            }
        //            freccia?.moveTo(status: status)
        //            fitRun?.initializeFitRun(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent();
        //        }
        //
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "pear" {
        //            playSoundGood()
        //            if status >= 18.2 {
        //                status -= 0.2
        //            }
        //            freccia?.moveTo(status: status)
        //            fitRun?.initializeFitRun(status: status)
        //
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent();
        //        }
        //
        //
        //        // Junk food
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "hotdog" {
        //            playSoundJunk()
        //            if status <= 34.5{
        //                status += 0.5
        //            }
        //            freccia?.moveTo(status: status)
        //            fitRun?.initializeFitRun(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent();
        //
        //        }
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "lollipop" {
        //            playSoundJunk()
        //            if status <= 34.9{
        //                status += 0.1
        //            }
        //            freccia?.moveTo(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent();
        //            fitRun?.initializeFitRun(status: status)
        //
        //        }
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "donut" {
        //            playSoundJunk()
        //            if status <= 34.3{
        //                status += 0.7
        //            }
        //            freccia?.moveTo(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent();
        //            fitRun?.initializeFitRun(status: status)
        //
        //        }
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "sandwich" {
        //            playSoundJunk()
        //            if status <= 34.7
        //            {
        //                status += 0.3
        //            }
        //            freccia?.moveTo(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent();
        //            fitRun?.initializeFitRun(status: status)
        //        }
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "fries" {
        //            playSoundJunk()
        //            if status <= 34
        //            {
        //                status += 1.0;
        //            }
        //            freccia?.moveTo(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent();
        //            fitRun?.initializeFitRun(status: status)
        //        }
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "fliynghotdog" {
        //            playSoundJunk()
        //            if status <= 32
        //            {
        //                status += 3.0;
        //            }
        //            freccia?.moveTo(status: status)
        //            bmiNum?.text = String(status);
        //            secondBody.node?.removeFromParent();
        //            fitRun?.initializeFitRun(status: status)
        //        }
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "ciboFrigo1" {
        //            playSoundJunk()
        //            if status <= 32.6
        //            {
        //                status += 2.4;
        //                bmiNum?.text = String(status);
        //            }
        //            freccia?.moveTo(status: status)
        //            secondBody.node?.removeFromParent();
        //            fitRun?.initializeFitRun(status: status)
        //        }
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "ciboFrigo2" {
        //            playSoundJunk()
        //            if status <= 33
        //            {
        //                status += 2.0;
        //                bmiNum?.text = String(status);
        //            }
        //            freccia?.moveTo(status: status)
        //            secondBody.node?.removeFromParent();
        //            fitRun?.initializeFitRun(status: status)
        //        }
        //
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "ciboFrigo3" {
        //            playSoundJunk()
        //            if status <= 33.7
        //            {
        //                status += 1.3;
        //                bmiNum?.text = String(status);
        //            }
        //            freccia?.moveTo(status: status)
        //            secondBody.node?.removeFromParent();
        //            fitRun?.initializeFitRun(status: status)
        //        }
        //
        //        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "ciboFrigo4" {
        //            playSoundJunk()
        //            if status <= 33.3
        //            {
        //                status += 1.7;
        //                bmiNum?.text = String(status);
        //            }
        //            freccia?.moveTo(status: status)
        //            secondBody.node?.removeFromParent()
        //            fitRun?.initializeFitRun(status: status)
        //        }
        //
    }
    
    private func initializeGame(){
        
        GameViewController.playSoundLevel2()

        mainCamera2 = childNode(withName: "MainCamera2") as? SKCameraNode

        fitRun2 = childNode(withName: "FitRun2") as? FitRun
        fitRun2?.initializeFitRun(status: status)
        
        ground1 = childNode(withName: "moonfloor1") as? GroundClass
        ground1?.initializeGroundAndFloor()
        
        ground2 = childNode(withName: "moonfloor2") as? GroundClass
        ground2?.initializeGroundAndFloor()
        
        ground3 = childNode(withName: "moonfloor3") as? GroundClass
        ground3?.initializeGroundAndFloor()
        
        trampolino1 = childNode(withName: "trampolino1") as? trampolino
        trampolino1?.initializeTrampolino()
        
        meteora1 = childNode(withName: "meteora1") as? meteora
        
        ufo1 = childNode(withName: "ufo1") as? ufo
        ufo1?.moveUfo(camera: mainCamera2!)

        bmiNum = mainCamera2!.childNode(withName: "BmiNum")
            as? SKLabelNode;
        bmiNum?.text = "18.0"
        ScoreNum = mainCamera2!.childNode(withName: "ScoreNum")
            as? SKLabelNode;
        ScoreNum?.text = "0"
    }
    
    private func manageCamera(){
        self.mainCamera2?.position.x += 8;
    }
    
    private func manageBGsAndGrounds() {
//        bg1?.moveBG(camera: mainCamera!)
//        bg2?.moveBG(camera: mainCamera!)
//        bg3?.moveBG(camera: mainCamera!)
        ground1?.moveGrounds(camera: mainCamera2!)
        ground2?.moveGrounds(camera: mainCamera2!)
        ground3?.moveGrounds(camera: mainCamera2!)
        
    }
    
    func playSoundSpring() {
        guard let url = Bundle.main.url(forResource: "Spring", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            player.volume = 5.0
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func  gameover(){
        playSoundGameover()
        if let scene = GameOver(fileNamed: "GameOver") {
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view!.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
        }
    }
    
    func playSoundGameover() {
        guard let url = Bundle.main.url(forResource: "gameover", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
