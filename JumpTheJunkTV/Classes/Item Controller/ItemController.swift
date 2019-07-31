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
        return item!
    }
    
    
}
