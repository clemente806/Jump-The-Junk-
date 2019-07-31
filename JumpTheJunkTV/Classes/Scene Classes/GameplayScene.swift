////
//  GameplayScene.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 05/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit
import AVFoundation
import GameController


class GameplayScene: SKScene, SKPhysicsContactDelegate{
    
    //var musicBackground: SKAudioNode!
    
    var backgroundMusic: SKAudioNode!
    
    var player: AVAudioPlayer?
    
    var getTimer: Timer?
    
    private var bg1: BGClass?
    private var bg2: BGClass?
    private var bg3: BGClass?
    
    private var ground1: GroundClass?
    private var ground2: GroundClass?
    private var ground3: GroundClass?
    private var ground4: GroundClass?
    
    private var fitRun: FitRun?
    private var FliyngHotDog1: fliynghotdog?
    
    private var fridge1: Fridge?
    private var fridge2: Fridge?
    
    private var barra1: barraRossa?
    private var barra2: barraRossa?
    private var barra4: barraRossa?
    private var barra5: barraRossa?
    private var barra6: barraRossa?
    private var barra7: barraRossa?
    private var barra8: barraRossa?
    private var barra9: barraRossa?
    private var barra10: barraRossa?
    private var barra11: barraRossa?
    private var barra12: barraRossa?
    private var barra13: barraRossa?
    private var barra14: barraRossa?
    private var barra15: barraRossa?
    private var barra16: barraRossa?
    private var barra17: barraRossa?
    private var barra18: barraRossa?
    private var barra19: barraRossa?
    private var barra20: barraRossa?
    private var barra21: barraRossa?
    private var barra22: barraRossa?
    private var barra23: barraRossa?
    private var barra24: barraRossa?

    private var cloud1: cloud?
    private var cloud2: cloud?
    private var cloud3: cloud?
    private var cloud4: cloud?
    
    private var freccia: Freccia?
    
    private var buca1: blackHole?
    private var buca2: blackHole?
    private var buca3: blackHole?
    private var buca4: blackHole?
    private var buca5: blackHole?
    
    private var star1: Star?
    private var star2: Star?
    private var star3: Star?
    private var star4: Star?
    private var star5: Star?
    private var star6: Star?
    private var star7: Star?
    private var star8: Star?
    private var star9: Star?
    private var star10: Star?
    private var star11: Star?
    
    public var cibo1 : SKSpriteNode?
    public var cibo2 : SKSpriteNode?
    public var cibo3 : SKSpriteNode?
    public var cibo4 : SKSpriteNode?
    public var cibo5 : SKSpriteNode?
    public var cibo6 : SKSpriteNode?
    public var cibo7 : SKSpriteNode?
    public var cibo8 : SKSpriteNode?
    public var cibo9 : SKSpriteNode?
    public var cibo10 : SKSpriteNode?
    public var cibo11 : SKSpriteNode?
    public var cibo12 : SKSpriteNode?
    public var cibo13 : SKSpriteNode?
    public var cibo14 : SKSpriteNode?
    public var cibo15 : SKSpriteNode?
    public var cibo16 : SKSpriteNode?
    public var cibo17 : SKSpriteNode?
    public var cibo18 : SKSpriteNode?
    public var cibo19 : SKSpriteNode?
    public var cibo20 : SKSpriteNode?
    public var cibo21 : SKSpriteNode?
    public var cibo22 : SKSpriteNode?
    public var cibo23 : SKSpriteNode?
    public var cibo24 : SKSpriteNode?
    public var cibo25 : SKSpriteNode?
    public var cibo26 : SKSpriteNode?
    public var cibo27 : SKSpriteNode?
    public var cibo28 : SKSpriteNode?
    public var cibo29 : SKSpriteNode?
    public var cibo30 : SKSpriteNode?
    public var cibo31 : SKSpriteNode?
    public var cibo32 : SKSpriteNode?
    public var cibo33 : SKSpriteNode?
    public var cibo34 : SKSpriteNode?
    public var cibo35 : SKSpriteNode?
    public var cibo36 : SKSpriteNode?
    public var cibo37 : SKSpriteNode?
    public var cibo38 : SKSpriteNode?
    public var cibo39 : SKSpriteNode?
    public var cibo40 : SKSpriteNode?
    
    private var sveglia: sveglia?
    
    private var mainCamera: SKCameraNode?;
    private var secondCamera: SKCameraNode?
    
    private var itemController = ItemController()
    
    private var bmiNum: SKLabelNode?
    private var ScoreNum: SKLabelNode?
    
    var score : Int = 0 {
        didSet {
            GameViewController.score = score
        }
    }
    public var status = 18.0;
    
    var ableToJump = true
    var gameOver = true
    
    var lancio : SKSpriteNode?
//    var rotLancio = true
    
    var firstBody = SKPhysicsBody()
    var secondBody = SKPhysicsBody()
    
    var controller = GCController.controllers().first
    
    override func didMove (to view: SKView) {
        initializeGame()
    }
    
    override func update(_ currentTime: TimeInterval){
        
        if fitRun?.physicsBody?.velocity.dy == 0{
            ableToJump = true
        }
        else {
            ableToJump = false
        }
        if status >= 18.0 && status <= 25.0 {
            score += 1
        }
        ScoreNum?.text = String(score);
        
        if fitRun!.position.x < self.mainCamera!.position.x - (self.scene!.frame.width / 2 - 60) {
            fitRun?.removeFromParent()
            gameOver = false
        }
        if !gameOver {
            gameover()
        }
        
        manageCamera()
        manageSecondCamera()
        manageBGsAndGrounds()
        cloud1?.moveCloudlLento()
        cloud2?.moveCloudVeloce()
        cloud3?.moveCloudVeloce()
        cloud4?.moveCloudlLento()
        
//        Controllo caduta del personaggio
        if ((fitRun?.position.y)! < self.mainCamera!.position.y-2000){
            gameOver = false
        }
                
        fitRun?.move(status: status, camera: mainCamera!.position.x);
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
    
    func endGamef(){
//        GameViewController.playSoundLevel1().stop()
        if let scene = endGame(fileNamed: "endGame") {
            scene.scaleMode = .aspectFill
            view!.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(1)));
            }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        controller?.motion?.valueChangedHandler = {(motion: GCMotion)->() in
            let y = motion.userAcceleration.y
            
            var fitJumpAnimation = [SKTexture]();
            var animateFitJumpAction = SKAction();
            
            if self.ableToJump == true && y > 1.0 {
                self.playSoundJump()
                self.ableToJump = false
                self.name = "FitJump";
                if self.status <= 25.0{
                    self.fitRun?.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 700))
                    for i in 1...6 {
                        let name = "fitJ\(i)";
                        fitJumpAnimation.append(SKTexture(imageNamed: name));
                    }
                }
                else {
                    self.fitRun?.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 500))
                    for i in 1...6 {
                        let name1 = "fatJ\(i)";
                        fitJumpAnimation.append(SKTexture(imageNamed: name1));
                    }
                }
                animateFitJumpAction = SKAction.animate(with: fitJumpAnimation, timePerFrame: 0.20
                    , resize: true, restore: false);
                self.fitRun?.run(SKAction.repeat(animateFitJumpAction, count: 1));
            }
        }
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
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "barra1" || secondBody.node?.name == "barra2"  {
            firstBody.node?.physicsBody?.collisionBitMask = (secondBody.node?.physicsBody!.collisionBitMask)!
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "sveglia1"{
            endGamef()
        }

        // Good food
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "apple" {
            playSoundGood()
            if status >= 18.6 {
                status -= 0.6
            }
            freccia?.moveTo(status: status)
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent()
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "banana" {
            playSoundGood()
            if status >= 18.4 {
                status -= 0.4
            }
            freccia?.moveTo(status: status)
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent()
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "broccoli" {
            playSoundGood()
            if status > 19 {
                status -= 1.0
            }
            freccia?.moveTo(status: status)
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent()
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "carrot" {
            playSoundGood()
            if status >= 18.8 {
                status -= 0.8
            }
            freccia?.moveTo(status: status)
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "pear" {
            playSoundGood()
            if status >= 18.2 {
                status -= 0.2
            }
            freccia?.moveTo(status: status)
            fitRun?.initializeFitRun(status: status)
         
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
        }
        
        
        // Junk food
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "hotdog" {
            playSoundJunk()
            if status <= 34.5{
                status += 0.5
            }
            freccia?.moveTo(status: status)
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
            
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "lollipop" {
            playSoundJunk()
            if status <= 34.9{
                status += 0.1
            }
            freccia?.moveTo(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
            
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "donut" {
            playSoundJunk()
            if status <= 34.3{
                status += 0.7
            }
            freccia?.moveTo(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
            
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "sandwich" {
            playSoundJunk()
            if status <= 34.7
            {
                status += 0.3
            }
            freccia?.moveTo(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "fries" {
            playSoundJunk()
            if status <= 34
            {
                status += 1.0;
            }
            freccia?.moveTo(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "fliynghotdog" {
            playSoundJunk()
            if status <= 32
            {
                status += 3.0;
            }
            freccia?.moveTo(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "ciboFrigo1" {
            playSoundJunk()
            if status <= 32.6
            {
                status += 2.4;
                bmiNum?.text = String(status);
            }
            freccia?.moveTo(status: status)
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "ciboFrigo2" {
            playSoundJunk()
            if status <= 33
            {
                status += 2.0;
                bmiNum?.text = String(status);
            }
            freccia?.moveTo(status: status)
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
        }

        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "ciboFrigo3" {
            playSoundJunk()
            if status <= 33.7
            {
                status += 1.3;
                bmiNum?.text = String(status);
            }
            freccia?.moveTo(status: status)
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
        }

        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "ciboFrigo4" {
            playSoundJunk()
            if status <= 33.3
            {
                status += 1.7;
                bmiNum?.text = String(status);
            }
            freccia?.moveTo(status: status)
            secondBody.node?.removeFromParent()
            fitRun?.initializeFitRun(status: status)
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "blackHole" || secondBody.node?.name == "blackHole2" || secondBody.node?.name == "blackHole3" || secondBody.node?.name == "blackHole4" || secondBody.node?.name == "blackHole5"{
            playCaduta()
            fitRun?.physicsBody?.collisionBitMask = 0
            fitRun?.position.x += 2
            if (status <= 25)
            {
                fitRun?.cadutaFit()
            }
            else{
                fitRun?.cadutaFat()
            }
        }
    }
    
    //MARK: - Inizializzo
    private func initializeGame(){
        
        physicsWorld.contactDelegate = self;
        GameViewController.playSoundLevel1()
        
        mainCamera = childNode(withName: "MainCamera") as? SKCameraNode;
        secondCamera = childNode(withName: "SecondCamera") as? SKCameraNode;
        
        bg1 = childNode(withName: "BG1") as? BGClass;
        bg2 = childNode(withName: "BG2") as? BGClass;
        bg3 = childNode(withName: "BG3") as? BGClass;
        
        ground1 = childNode(withName: "Ground1") as? GroundClass;
        ground2 = childNode(withName: "Ground2") as? GroundClass;
        ground3 = childNode(withName: "Ground3") as? GroundClass;
        ground4 = childNode(withName: "Ground4") as? GroundClass;
        
        buca1 = childNode(withName: "blackHole") as? blackHole;
        buca2 = childNode(withName: "blackHole2") as? blackHole;
        buca3 = childNode(withName: "blackHole3") as? blackHole;
        buca4 = childNode(withName: "blackHole4") as? blackHole;
        buca5 = childNode(withName: "blackHole5") as? blackHole;

        
        barra1 = childNode(withName: "barraRossa") as? barraRossa;
        barra1?.initializeBarra()
        
        barra2 = childNode(withName: "barraRossa2") as? barraRossa;
        barra2?.initializeBarra()
        
        barra4 = childNode(withName: "barraRossa4") as? barraRossa;
        barra4?.initializeBarra()
        
        barra5 = childNode(withName: "barraRossa5") as? barraRossa;
        barra5?.initializeBarra()
        
        barra6 = childNode(withName: "barraRossa6") as? barraRossa;
        barra6?.initializeBarra()
        
        barra7 = childNode(withName: "barraRossa7") as? barraRossa;
        barra7?.initializeBarra()
        
        barra8 = childNode(withName: "barraRossa8") as? barraRossa;
        barra8?.initializeBarra()
        
        barra9 = childNode(withName: "barraRossa9") as? barraRossa;
        barra9?.initializeBarra()
        
        barra10 = childNode(withName: "barraRossa10") as? barraRossa;
        barra10?.initializeBarra()
        
        barra11 = childNode(withName: "barraRossa11") as? barraRossa;
        barra11?.initializeBarra()
        
        barra12 = childNode(withName: "barraRossa12") as? barraRossa;
        barra12?.initializeBarra()
        
        barra13 = childNode(withName: "barraRossa13") as? barraRossa;
        barra13?.initializeBarra()
        
        barra14 = childNode(withName: "barraRossa14") as? barraRossa;
        barra14?.initializeBarra()
        
        barra15 = childNode(withName: "barraRossa15") as? barraRossa;
        barra15?.initializeBarra()
        
        barra16 = childNode(withName: "barraRossa16") as? barraRossa;
        barra16?.initializeBarra()
        
        barra17 = childNode(withName: "barraRossa17") as? barraRossa;
        barra17?.initializeBarra()
        
        barra18 = childNode(withName: "barraRossa18") as? barraRossa;
        barra18?.initializeBarra()
        
        barra19 = childNode(withName: "barraRossa19") as? barraRossa;
        barra19?.initializeBarra()
        
        barra20 = childNode(withName: "barraRossa20") as? barraRossa;
        barra20?.initializeBarra()
        
        barra21 = childNode(withName: "barraRossa21") as? barraRossa;
        barra21?.initializeBarra()
        
        barra22 = childNode(withName: "barraRossa22") as? barraRossa;
        barra22?.initializeBarra()
        
        barra23 = childNode(withName: "barraRossa23") as? barraRossa;
        barra23?.initializeBarra()
        
        barra24 = childNode(withName: "barraRossa24") as? barraRossa;
        barra24?.initializeBarra()
        
        cloud1 = childNode(withName: "cloud1") as? cloud;
        cloud2 = childNode(withName: "cloud2") as? cloud;
        cloud3 = childNode(withName: "cloud3") as? cloud;
        cloud4 = childNode(withName: "cloud4") as? cloud;
        
        FliyngHotDog1 = childNode(withName: "fliynghotdog") as? fliynghotdog;
        FliyngHotDog1?.initializeHotDog(camera: mainCamera!)

        
        fridge1 = mainCamera?.childNode(withName: "fridge1") as? Fridge;
        fridge1?.initializeFridge()
        fridge1?.animateFridge()
        
        fridge2 = mainCamera?.childNode(withName: "fridgeB") as? Fridge;
        fridge2?.initializeFridge()
        
        ground1?.initializeGroundAndFloor();
        ground2?.initializeGroundAndFloor();
        ground3?.initializeGroundAndFloor();
        ground4?.initializeGroundAndFloor();
        
        star1 = mainCamera?.childNode(withName: "star1") as? Star
        star1?.initializeStar()
        
        star2 = mainCamera?.childNode(withName: "star2") as? Star
        star2?.initializeStar()
        
        star3 = mainCamera?.childNode(withName: "star3") as? Star
        star3?.initializeStar()
        
        star4 = mainCamera?.childNode(withName: "star4") as? Star
        star4?.initializeStar()
        
        star5 = mainCamera?.childNode(withName: "star5") as? Star
        star5?.initializeStar()
        
        star6 = mainCamera?.childNode(withName: "star6") as? Star
        star6?.initializeStar()
        
        star7 = mainCamera?.childNode(withName: "star7") as? Star
        star7?.initializeStar()
        
        star8 = mainCamera?.childNode(withName: "star8") as? Star
        star8?.initializeStar()
        
        star9 = mainCamera?.childNode(withName: "star9") as? Star
        star9?.initializeStar()
        
        star10 = mainCamera?.childNode(withName: "star10") as? Star
        star10?.initializeStar()
        
        star11 = mainCamera?.childNode(withName: "star11") as? Star
        star11?.initializeStar()

        freccia = mainCamera?.childNode(withName: "freccia") as? Freccia;
        
        freccia?.initializeFreccia()
        
        
        cibo1 = childNode(withName: "cibo1") as? SKSpriteNode
        s(item: cibo1!)
        cibo2 = childNode(withName: "cibo2") as? SKSpriteNode
        s(item: cibo2!)
        cibo3 = childNode(withName: "cibo3") as? SKSpriteNode
        s(item: cibo3!)
        cibo4 = childNode(withName: "cibo4") as? SKSpriteNode
        s(item: cibo4!)
        cibo5 = childNode(withName: "cibo5") as? SKSpriteNode
        s(item: cibo5!)
        cibo6 = childNode(withName: "cibo6") as? SKSpriteNode
        s(item: cibo6!)
        cibo7 = childNode(withName: "cibo7") as? SKSpriteNode
        s(item: cibo7!)
        cibo8 = childNode(withName: "cibo8") as? SKSpriteNode
        s(item: cibo8!)
        cibo9 = childNode(withName: "cibo9") as? SKSpriteNode
        s(item: cibo9!)
        cibo10 = childNode(withName: "cibo10") as? SKSpriteNode
        s(item: cibo10!)
        cibo11 = childNode(withName: "cibo11") as? SKSpriteNode
        s(item: cibo11!)
        cibo12 = childNode(withName: "cibo12") as? SKSpriteNode
        s(item: cibo12!)
        cibo13 = childNode(withName: "cibo13") as? SKSpriteNode
        s(item: cibo13!)
        cibo14 = childNode(withName: "cibo14") as? SKSpriteNode
        s(item: cibo14!)
        cibo15 = childNode(withName: "cibo15") as? SKSpriteNode
        s(item: cibo15!)
        cibo16 = childNode(withName: "cibo16") as? SKSpriteNode
        s(item: cibo16!)
        cibo17 = childNode(withName: "cibo17") as? SKSpriteNode
        s(item: cibo17!)
        cibo18 = childNode(withName: "cibo18") as? SKSpriteNode
        s(item: cibo18!)
        cibo19 = childNode(withName: "cibo19") as? SKSpriteNode
        s(item: cibo19!)
        cibo20 = childNode(withName: "cibo20") as? SKSpriteNode
        s(item: cibo20!)
        cibo21 = childNode(withName: "cibo21") as? SKSpriteNode
        s(item: cibo21!)
        cibo22 = childNode(withName: "cibo22") as? SKSpriteNode
        s(item: cibo22!)
        cibo23 = childNode(withName: "cibo23") as? SKSpriteNode
        s(item: cibo23!)
        cibo24 = childNode(withName: "cibo24") as? SKSpriteNode
        s(item: cibo24!)
        cibo25 = childNode(withName: "cibo25") as? SKSpriteNode
        s(item: cibo25!)
        cibo26 = childNode(withName: "cibo26") as? SKSpriteNode
        s(item: cibo26!)
        cibo27 = childNode(withName: "cibo27") as? SKSpriteNode
        s(item: cibo27!)
        cibo28 = childNode(withName: "cibo28") as? SKSpriteNode
        s(item: cibo28!)
        cibo29 = childNode(withName: "cibo29") as? SKSpriteNode
        s(item: cibo29!)
        cibo30 = childNode(withName: "cibo30") as? SKSpriteNode
        s(item: cibo30!)
        cibo31 = childNode(withName: "cibo31") as? SKSpriteNode
        s(item: cibo31!)
        cibo32 = childNode(withName: "cibo32") as? SKSpriteNode
        s(item: cibo32!)
        cibo33 = childNode(withName: "cibo33") as? SKSpriteNode
        s(item: cibo33!)
        cibo34 = childNode(withName: "cibo34") as? SKSpriteNode
        s(item: cibo34!)
        cibo35 = childNode(withName: "cibo35") as? SKSpriteNode
        s(item: cibo35!)
        cibo36 = childNode(withName: "cibo36") as? SKSpriteNode
        s(item: cibo36!)
        cibo37 = childNode(withName: "cibo37") as? SKSpriteNode
        s(item: cibo37!)
        cibo38 = childNode(withName: "cibo38") as? SKSpriteNode
        s(item: cibo38!)
        cibo39 = childNode(withName: "cibo39") as? SKSpriteNode
        s(item: cibo39!)
        cibo40 = childNode(withName: "cibo40") as? SKSpriteNode
        s(item: cibo40!)

        fitRun = childNode(withName: "FitRun") as? FitRun;
        fitRun?.initializeFitRun(status: status);
        
        bmiNum = mainCamera!.childNode(withName: "BmiNum")
            as? SKLabelNode;
        bmiNum?.text = "18.0";
        ScoreNum = mainCamera!.childNode(withName: "ScoreNum")
            as? SKLabelNode;
        ScoreNum?.text = "0";
        
        buca1?.initializeblackHole()
        buca2?.initializeblackHole()
        buca3?.initializeblackHole()
        buca4?.initializeblackHole()
        buca5?.initializeblackHole()
        
        sveglia = childNode(withName: "sveglia1") as? sveglia
        sveglia?.initializeSveglia()
        
        // vel creazione ogg
          Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweenNumbers(firstNum: 5, secondNum: 8)), target: self, selector: #selector(GameplayScene.FridgeLancioOggetti), userInfo: nil, repeats: true);
  
        Timer.scheduledTimer(timeInterval: TimeInterval(7), target: self, selector: #selector(GameplayScene.removeItems), userInfo: nil, repeats: true);
        
    }
    
    private func manageCamera(){
        self.mainCamera?.position.x += 8;
    }
    
    private func manageSecondCamera(){
        self.secondCamera?.position.x += 8;
    }
    
    private func manageBGsAndGrounds() {
        bg1?.moveBG(camera: mainCamera!)
        bg2?.moveBG(camera: mainCamera!)
        bg3?.moveBG(camera: mainCamera!)
        
        ground1?.moveGrounds(camera: mainCamera!)
        ground2?.moveGrounds(camera: mainCamera!)
        ground3?.moveGrounds(camera: mainCamera!)

    }
    
    @objc private func FridgeLancioOggetti() {
        self.scene?.addChild(itemController.FridgeLancioOggetti(camera: mainCamera!))
        
        lancio = itemController.FridgeLancioOggetti(camera: mainCamera!)
        self.scene?.addChild(lancio!)
        lancio?.physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES

        lancio?.position.x = secondCamera!.position.x
        lancio?.position.y = secondCamera!.position.y
        lancio?.zPosition = 4
        lancio?.physicsBody?.affectedByGravity = true
        lancio?.physicsBody?.applyImpulse(CGVector(dx: 155,dy: 160))
        
    }
    
    @objc private func removeItems(){
        for child in children{
            if child.name == "apple" || child.name == "banana" || child.name == "broccoli"
                || child.name == "carrot" || child.name == "pear" || child.name == "lollipop"
                || child.name == "hotdog" || child.name == "sandwich"
                || child.name == "donut" || child.name == "fries" || child.name == "barraRossa"
                || child.name == "cloud" || child.name == "fliynghotdog"
                || child.name == "ciboFrigo1" || child.name == "ciboFrigo2"
                || child.name == "ciboFrigo3" || child.name == "ciboFrigo4" {
                
                if child.position.x < self.mainCamera!.position.x - self.scene!.frame.width / 2 {
                    child.removeFromParent();
                }
            
            }
        }
    }
    
    func playSoundJump() {
        guard let url = Bundle.main.url(forResource: "jump", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            player.volume = 3.0
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSoundGood() {
        guard let url = Bundle.main.url(forResource: "good", withExtension: "wav") else { return }
        
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
    
    func playCaduta() {
        guard let url = Bundle.main.url(forResource: "caduta", withExtension: "wav") else { return }
        
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
    
    func playSoundJunk() {
        guard let url = Bundle.main.url(forResource: "junk", withExtension: "wav") else { return }
        
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
    
    @objc func controllerDidConnect(note: NSNotification)
    {
        print("DENTro")
        controller = GCController.controllers().first
        controller?.motion?.valueChangedHandler = {(motion: GCMotion)->() in
        let userAccelerationLabelXString = "X = \(String(format: "%.3f", motion.userAcceleration.x))\n"
        let userAccelerationLabelYString = "Y = \(String(format: "%.3f", motion.userAcceleration.y))\n"
        let userAccelerationLabelZString = "Z = \(String(format: "%.3f", motion.userAcceleration.z))"
        print(userAccelerationLabelXString, userAccelerationLabelYString, userAccelerationLabelZString)
        }
    }
}

func s(item : SKSpriteNode) {
    
    let index = Int.random(in: 0..<10)
    print(index)
    switch index {
    case 0:
        item.texture = SKTexture(imageNamed:"banana")
        item.name = "banana"
        item.setScale(0.8)
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
    case 1:
        item.texture = SKTexture(imageNamed:"apple")
        item.name = "apple";
        item.setScale(0.8);
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
    case 2:
        item.texture = SKTexture(imageNamed:"broccoli")
        item.name = "broccoli"
        item.setScale(0.8)
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
    case 3:
        item.texture = SKTexture(imageNamed:"carrot")
        item.name = "carrot";
        item.setScale(0.8);
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
    case 4:
        item.texture = SKTexture(imageNamed:"pear")
        item.name = "pear"
        item.setScale(0.8)
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
    case 5:
        item.texture = SKTexture(imageNamed:"hotdog")
        item.name = "hotdog";
        item.setScale(0.8);
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
    case 6:
        item.texture = SKTexture(imageNamed:"fries")
        item.name = "fries";
        item.setScale(0.8);
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size);
    case 7:
        item.texture = SKTexture(imageNamed:"lollipop")
        item.name = "lollipop";
        item.setScale(0.8);
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size);
    case 8:
        item.texture = SKTexture(imageNamed:"sandwich")
        item.name = "sandwich";
        item.setScale(0.8);
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size);
    default:
        item.texture = SKTexture(imageNamed:"donut")
        item.name = "donut"
        item.setScale(0.8)
        item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
    }

    item.physicsBody?.affectedByGravity = true
    item.physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES
    
    item.zPosition = 4
    item.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    
}

