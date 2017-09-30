//
//  GameScene.swift
//  TestGame
//
//  Created by Lazarev, Aleksey on 9/27/17.
//  Copyright © 2017 Lazarev, Aleksey. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var bgTexture: SKTexture!
    
    //Sprite Nodes
    var bg = SKSpriteNode()
    
    //Sprite Objects
    var bgObject = SKNode()
    
    override func didMove(to view: SKView) {
        bgTexture = SKTexture(imageNamed: "bg01.png")
        
        creteObjects()
        createGame()
    }
    
    func creteObjects() {
        self.addChild(bgObject )
    }
    
    func createGame() {
        createBG()
    }
    
    func createBG() {
        bgTexture = SKTexture(imageNamed: "bg01.png")
        
        let moveBg = SKAction.moveBy(x: -bgTexture.size().width, y: 0, duration: 3)
        let replaceBg = SKAction.moveBy(x: bgTexture.size().width, y: 0, duration: 0)
        let moveBgForever = SKAction.repeatForever(SKAction.sequence([moveBg, replaceBg]))
        
        for i in 0 ..< 3 {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: size.width / 4 + bgTexture.size().width * CGFloat(i), y: size.height / 2.0)
            bg.size.height = self.frame.size.height
            
            bg.run(moveBgForever)
            
            bg.zPosition = -1
            
            bgObject.addChild(bg)
        }
    }
    
  
}
