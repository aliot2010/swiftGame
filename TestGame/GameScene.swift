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
    var flyHeroTexture: SKTexture!
    
    //Sprite Nodes
    var bg = SKSpriteNode()
    var hero = SKSpriteNode()
    var ground = SKSpriteNode()
    
    //Sprite Objects
    var bgObject = SKNode()
    var heroObject = SKNode()
    var groundObject = SKNode()
    
    var heroBitMask: UInt32 = 1
    var groundBitMask: UInt32 = 2
    
    var heroFlyTextureArray = [SKTexture]()

    override func didMove(to view: SKView) {
        bgTexture = SKTexture(imageNamed: "bg01.png")
        
        flyHeroTexture = SKTexture(imageNamed: "run01.png ")
        
        creteObjects()
        createGame()
    }
    
    func creteObjects() {
        self.addChild(bgObject)
        self.addChild(groundObject)
        self.addChild(heroObject)
    }
    
    func createGame() {
        createBG()
        createGroung()
        createHero()
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
    
    func addHero(heroNode: SKSpriteNode, atPosition postion: CGPoint)  {
         hero = SKSpriteNode(texture: flyHeroTexture)
        
        heroFlyTextureArray = [SKTexture(imageNamed: "run01.png"), SKTexture(imageNamed: "run02.png"), SKTexture(imageNamed: "run03.png"), SKTexture(imageNamed: "run04.png")]
        
        let heroRunAnimation = SKAction.animate(with: heroFlyTextureArray, timePerFrame: 0.1 )
        let runHero = SKAction.repeatForever(heroRunAnimation)
        hero.run(runHero)
        
        hero.position = postion
        hero.size.height = 124
        hero.size.width = 84
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: hero.size.width - 15 , height: hero.size.height))
        
//        hero.physicsBody?.categoryBitMask = heroBitMask
//        hero.physicsBody?.contactTestBitMask = groundBitMask
//        hero.physicsBody?.contactTestBitMask = groundBitMask
        
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.allowsRotation = false
        hero.physicsBody?.restitution = 0.0
        hero.physicsBody?.usesPreciseCollisionDetection = true
        
        hero.zPosition = 1
        
        heroObject.addChild(hero)
    }
    
    func createGroung() {
        ground = SKSpriteNode()
        ground.color = SKColor.red
        
        ground.position = CGPoint(x: self.frame.width / 2, y: 0)
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: self.frame.height / 4 + 5))
        ground.physicsBody?.isDynamic = false
//        ground.physicsBody?.categoryBitMask = groundBitMask
//        ground.physicsBody?.contactTestBitMask = groundBitMask
        ground.zPosition = 1
        ground.physicsBody?.restitution = 0.0
        
        groundObject.addChild(ground)
        
    }
    
    func createHero() {
        self.addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width / 6, y: flyHeroTexture.size().height * 4 ))
    }
    
}
