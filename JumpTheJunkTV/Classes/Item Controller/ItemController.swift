//
//  ItemController.swift
//  Jump The Junk
//
//  Created by Vincenzo Cusaniello on 06/01/18.
//  Copyright © 2018 Vincenzo Cusaniello. All rights reserved.
//

import SpriteKit

class ItemController {
    
    private var minY = CGFloat(72), maxY = CGFloat(600);
    
    func randomBetweenNumbers(firstNum: CGFloat,secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs (firstNum - secondNum) + min(firstNum, secondNum);
    }
    
    func FridgeLancioOggetti(camera: SKCameraNode) -> SKSpriteNode{
        
        let item: SKSpriteNode?;

        switch Int(randomBetweenNumbers(firstNum: 1, secondNum: 4)) {
        case 1:
            item = SKSpriteNode(imageNamed: "ciboFrigo1");
            item?.name = "ciboFrigo1";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 2:
            item = SKSpriteNode(imageNamed: "ciboFrigo4");
            item?.name = "ciboFrigo4";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 3:
            item = SKSpriteNode(imageNamed: "ciboFrigo2");
            item?.name = "ciboFrigo2";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 4:
            item = SKSpriteNode(imageNamed: "ciboFrigo3");
            item?.name = "ciboFrigo3";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        default:
            item = SKSpriteNode(imageNamed: "ciboFrigo4");
            item?.name = "ciboFrigo4";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        }
        //        item?.position.x = -100
        //        item?.position.y = 700
//        item?.position.x = camera.position.x
//        item?.position.y = camera.position.y
//        item?.zPosition = 4
//        item!.physicsBody?.affectedByGravity = true
//        item?.physicsBody?.applyImpulse(CGVector(dx: 120,dy: 30))

//        item?.physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES
//
//        item?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        return item!
        
//        item?.physicsBody?.applyImpulse(CGVector(dx: 120,dy: 30))
//        let item: SKSpriteNode?;
//        let i: Int = Int.random(in: 1...4)
//        let stringa: String = String(i)
//        let nameFood: String = "ciboFrigo" + stringa
//        item = SKSpriteNode(imageNamed: nameFood);
//        //        item?.name = "ciboFrigo1";
//        item?.setScale(0.8);
//        item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
//
//        item!.physicsBody?.affectedByGravity = true
//        item?.physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES
//
//        item?.zPosition = 4
//        item?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//
//
//        //        let x = self.position.x
//        //        let y = self.position.y
//        item?.position.x = -100
//        item?.position.y = 700
       
        
    }
    
    func spawnItems(camera: SKCameraNode) -> SKSpriteNode {
        
        let item: SKSpriteNode?;
        
        switch Int(randomBetweenNumbers(firstNum: 0, secondNum: 9)) {
        case 0:
            item = SKSpriteNode(imageNamed: "banana");
            item?.name = "banana";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 1:
            item = SKSpriteNode(imageNamed: "apple");
            item?.name = "apple";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 2:
            item = SKSpriteNode(imageNamed: "broccoli");
            item?.name = "broccoli";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 3:
            item = SKSpriteNode(imageNamed: "carrot");
            item?.name = "carrot";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 4:
            item = SKSpriteNode(imageNamed: "pear");
            item?.name = "pear";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 5:
            item = SKSpriteNode(imageNamed: "hotdog");
            item?.name = "hotdog";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 6:
            item = SKSpriteNode(imageNamed: "fries");
            item?.name = "fries";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 7:
            item = SKSpriteNode(imageNamed: "lollipop");
            item?.name = "lollipop";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        case 8:
            item = SKSpriteNode(imageNamed: "sandwich");
            item?.name = "sandwich";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        default:
            item = SKSpriteNode(imageNamed: "donut");
            item?.name = "donut";
            item?.setScale(0.8);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
        }
        
        item!.physicsBody?.affectedByGravity = true
        item?.physicsBody?.categoryBitMask = ColliderType.JUNK_AND_COLLECTABLES
        
        item?.zPosition = 4
        item?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        item?.position.x = camera.position.x + 1100
        item?.position.y = randomBetweenNumbers(firstNum: minY, secondNum: maxY)
        
        return item!
    }
    
    
} // class














































