////
//  GameplayScene.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 05/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameplayScene: SKScene, SKPhysicsContactDelegate{
    
    //var musicBackground: SKAudioNode!
    
    var backgroundMusic: SKAudioNode!
    
    var player: AVAudioPlayer?
    
    var getTimer: Timer?

    
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
    private var FliyngHotDog1: fliynghotdog?;
    
    private var fridge1: Fridge?;
    private var fridge2: Fridge?;
    
    private var barra1: barraRossa?;
    private var barra2: barraRossa?;

    private var cloud1: cloud?
    private var cloud2: cloud?
    
    private var mainCamera: SKCameraNode?;
    private var secondCamera: SKCameraNode?;
    
    private var itemController = ItemController();
    
    private var bmiNum: SKLabelNode?;
    private var ScoreNum: SKLabelNode?;
    private var score = 0
    public var status = 18.0;
    
    var ableToJump = true
    var gameOver = true
    
    var lancio : SKSpriteNode?
    var rotLancio = true
    
    var firstBody = SKPhysicsBody();
    var secondBody = SKPhysicsBody();
    
    override func didMove (to view: SKView) {
        initializeGame();
        
    }
    
    override func update(_ currentTime: TimeInterval){
        
        if fitRun?.physicsBody?.velocity.dy == 0{
            ableToJump = true
        }
        else {
            ableToJump = false
        }
        if status > 18.0 && status <= 25.0 {
            score += 1
        }
        ScoreNum?.text = String(score);
        
        if fitRun!.position.x < self.mainCamera!.position.x - self.scene!.frame.width / 2{
            fitRun?.removeFromParent()
            gameOver = false
        }
        if !gameOver {
            gameover();
        }
        
        manageCamera();
        manageSecondCamera();
        manageBGsAndGrounds();
        
        cloud1?.moveCloudlLento()
        cloud2?.moveCloudVeloce()

        
        
        fitRun?.move(status: status, camera: mainCamera!.position.x);
        
        if(!rotLancio){
            lancio?.zRotation = 0
        }
        else{
            lancio?.zRotation += .pi / 4.0;
        }
//                if (!rotLancio || firstBody.node?.name == "ciboFrigo1" || firstBody.node?.name == "ciboFrigo2" || firstBody.node?.name == "ciboFrigo3" || firstBody.node?.name == "ciboFrigo4" && secondBody.node?.name == "barra1"){
//                    lancio?.zRotation = 0
//                }
//                else{
//                    lancio?.zRotation += .pi / 4.0;
//                }
               
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playSoundJump()
        var fitJumpAnimation = [SKTexture]();
        var animateFitJumpAction = SKAction();
        if ableToJump == true {
            
            name = "FitJump";
            if status <= 25.0{
                fitRun?.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 600))
                for i in 1...6 {
                    let name = "fitJ\(i)";
                    fitJumpAnimation.append(SKTexture(imageNamed: name));
                }
            }
            else {
                fitRun?.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 550))
                for i in 1...6 {
                    let name1 = "fatJ\(i)";
                    fitJumpAnimation.append(SKTexture(imageNamed: name1));
                }
            }
            animateFitJumpAction = SKAction.animate(with: fitJumpAnimation, timePerFrame: 0.20
                , resize: true, restore: false);
            fitRun?.run(SKAction.repeat(animateFitJumpAction, count: 1));
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody = SKPhysicsBody();
        var secondBody = SKPhysicsBody();
//        let thirdBody = lancio?.physicsBody?.allContactedBodies()
//
//        let cont = thirdBody!.contains(barra1!.physicsBody!)
        
        
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
        if (rotLancio){
            rotLancio = false
        }
        // Good food
    
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "apple" {
            playSoundGood()
            if status >= 18.6 {
                status -= 0.6
            }
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent()
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "banana" {
            playSoundGood()
            if status >= 18.4 {
                status -= 0.4
            }
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent()
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "broccoli" {
            playSoundGood()
            if status > 19 {
                status -= 1.0
            }
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent()
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "carrot" {
            playSoundGood()
            if status >= 18.8 {
                status -= 0.8
            }
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
        }
        
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "pear" {
            playSoundGood()
            if status >= 18.2 {
                status -= 0.2
            }
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
            fitRun?.initializeFitRun(status: status)
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
            
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "lollipop" {
            playSoundJunk()
            if status <= 34.9{
                status += 0.1
            }
            bmiNum?.text = String(status);
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
            
        }
        if firstBody.node?.name == "FitRun" && secondBody.node?.name == "donut" {
            playSoundJunk()
            if status <= 34.3{
                status += 0.7
            }
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
            
            secondBody.node?.removeFromParent();
            fitRun?.initializeFitRun(status: status)
        }
    }
    
    private func initializeGame(){
        
        physicsWorld.contactDelegate = self;
        
        mainCamera = childNode(withName: "MainCamera") as? SKCameraNode;
        secondCamera = childNode(withName: "SecondCamera") as? SKCameraNode;
        
        bg1 = childNode(withName: "BG1") as? BGClass;
        bg2 = childNode(withName: "BG2") as? BGClass;
        bg3 = childNode(withName: "BG3") as? BGClass;
        
        tree1 = childNode(withName: "Tree1") as? TreeClass;
        tree2 = childNode(withName: "Tree2") as? TreeClass;
        tree3 = childNode(withName: "Tree3") as? TreeClass;
        
        ground1 = childNode(withName: "Ground1") as? GroundClass;
        ground2 = childNode(withName: "Ground2") as? GroundClass;
        ground3 = childNode(withName: "Ground3") as? GroundClass;
        
        barra1 = childNode(withName: "barraRossa") as? barraRossa;
        barra1?.initializeBarra()
        
        barra2 = childNode(withName: "barraRossa2") as? barraRossa;
        barra2?.initializeBarra()
        
        cloud1 = childNode(withName: "cloud1") as? cloud;
        cloud2 = childNode(withName: "cloud2") as? cloud;
        FliyngHotDog1 = childNode(withName: "fliynghotdog") as? fliynghotdog;
        FliyngHotDog1?.initializeHotDog()

        
        fridge1 = mainCamera?.childNode(withName: "fridge1") as? Fridge;
        fridge1?.initializeFridge()
        
        fridge2 = mainCamera?.childNode(withName: "fridge2") as? Fridge;
        fridge2?.initializeFridge()
        
        ground1?.initializeGroundAndFloor();
        ground2?.initializeGroundAndFloor();
        ground3?.initializeGroundAndFloor();
        
        fitRun = childNode(withName: "FitRun") as? FitRun;
        fitRun?.initializeFitRun(status: status);
        
        bmiNum = mainCamera!.childNode(withName: "BmiNum")
            as? SKLabelNode;
        bmiNum?.text = "18.0";
        ScoreNum = mainCamera!.childNode(withName: "ScoreNum")
            as? SKLabelNode;
        ScoreNum?.text = "0";
        
        // vel creazione ogg
          Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweenNumbers(firstNum: 5, secondNum: 8)), target: self, selector: #selector(GameplayScene.FridgeLancioOggetti), userInfo: nil, repeats: true);
        
        Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweenNumbers(firstNum: 1.5, secondNum: 3)), target: self, selector: #selector(GameplayScene.spawnItems), userInfo: nil, repeats: true);
        
        Timer.scheduledTimer(timeInterval: TimeInterval(7), target: self, selector: #selector(GameplayScene.removeItems), userInfo: nil, repeats: true);
        
    }
    
    private func manageCamera(){
        self.mainCamera?.position.x += 13;
    }
    
    private func manageSecondCamera(){
        self.secondCamera?.position.x += 13;
    }
    
    private func manageBGsAndGrounds() {
        bg1?.moveBG(camera: mainCamera!);
        bg2?.moveBG(camera: mainCamera!);
        bg3?.moveBG(camera: mainCamera!);
        
        ground1?.moveGrounds(camera: mainCamera!);
        ground2?.moveGrounds(camera: mainCamera!);
        ground3?.moveGrounds(camera: mainCamera!);
        
        tree1?.moveTree(camera: secondCamera!);
        tree2?.moveTree(camera: secondCamera!);
        tree3?.moveTree(camera: secondCamera!);
    }
    
    @objc private func spawnItems() {
        self.scene?.addChild(itemController.spawnItems(camera: mainCamera!));
    }
    
    @objc private func FridgeLancioOggetti() {
        self.scene?.addChild(itemController.FridgeLancioOggetti(camera: mainCamera!));
        
        lancio = itemController.FridgeLancioOggetti(camera: mainCamera!)
        self.scene?.addChild(lancio!)
        lancio?.physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES

        lancio?.position.x = secondCamera!.position.x
        lancio?.position.y = secondCamera!.position.y
        lancio?.zPosition = 4
        lancio?.physicsBody?.affectedByGravity = true
        lancio?.physicsBody?.applyImpulse(CGVector(dx: 120,dy: 30))
        

        
//        if (!rotLancio || firstBody.node?.name == "ciboFrigo1" || firstBody.node?.name == "ciboFrigo2" || firstBody.node?.name == "ciboFrigo3" || firstBody.node?.name == "ciboFrigo4" && secondBody.node?.name == "barra1"){
//            lancio!.zRotation = 0
//        }
//        else{
//            lancio!.zRotation += .pi / 4.0;
//        }
//        if(lancio!.position.y <= -40){
//            rotLancio = false
//        }
    }
    
    @objc private func removeItems(){
        for child in children{
            if child.name == "apple" || child.name == "banana" || child.name == "broccoli"
                || child.name == "carrot" || child.name == "pear" || child.name == "lollipop"
                || child.name == "hotdog" || child.name == "sandwich"
                || child.name == "donut" || child.name == "fries" || child.name == "barraRossa"
                || child.name == "cloud" || child.name == "fliynghotdog"
                || child.name == "ciboFrigo1" || child.name == "ciboFrigo2"
                || child.name == "ciboFrigo3" || child.name == "ciboFrigo4"
{
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
}
























