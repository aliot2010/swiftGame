//
//  GameScene_Touch.swift
//  TestGame
//
//  Created by Lazarev, Aleksey on 10/3/17.
//  Copyright © 2017 Lazarev, Aleksey. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (!(hero.physicsBody?.allContactedBodies().isEmpty)!) {
            if(hero.physicsBody?.allContactedBodies()[0].isEqual(ground.physicsBody))! {
                hero.run(SKAction.stop())
                hero.texture = SKTexture(imageNamed: "jump.png")
                hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 280))
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
}
