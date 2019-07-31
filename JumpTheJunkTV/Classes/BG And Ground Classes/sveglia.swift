import SpriteKit

class sveglia: SKSpriteNode {
    
    func initializeSveglia(){
//        self.size=CGSize(width: 200, height: 200)
        physicsBody = SKPhysicsBody(rectangleOf: self.size)
        physicsBody?.affectedByGravity = true;
        physicsBody?.isDynamic = true;
        physicsBody?.collisionBitMask = ColliderType.SVEGLIA;
    }
} // Class
