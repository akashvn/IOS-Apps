//
//  GameScene.swift
//  Pong_Project
//
//  Created by Akash Vemulapalli on 3/6/19.
//  Copyright © 2019 Vemulapalli. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    //Creates all of the bodies and sprites
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    //Creating an array of possible scores
    var score = [Int]()
    
    //Creating Labels for the scores
    var topLabel = SKLabelNode()
    var bottomLabel = SKLabelNode()
    
    var speedofball = 0.0;
    
    override func didMove(to view: SKView)
    {
        
        
        
        //Creates all of the bodies and sprites
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode

        
        
        topLabel = self.childNode(withName: "topLabel") as! SKLabelNode
        bottomLabel = self.childNode(withName: "bottomLabel") as! SKLabelNode

        
        
        
        //Gives the ball an initial push off so it can reach the paddle when the game starts
        
        
        
        //Creating a border so the ball doesn't fly into space
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        
        startGame()
        
    }
    
    
    //To recognize touches to move the paddle (This happens when they originally touch the screen)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            if currentGameType == .player2
            {
                if location.y>0
                {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.15))
                    
                }
                if location.y<0
                {
                    main.run(SKAction.moveTo(x: location.x, duration: 0.15))
                }
            }
            else
            {
                main.run(SKAction.moveTo(x: location.x, duration: 0.15))
                
            }
            
        }
    }
    
    
    //To recognize touches to move the paddle (This happens when they drag their finger)
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            if currentGameType == .player2
            {
                if location.y>0
                {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.15))
                    
                }
                if location.y<0
                {
                    main.run(SKAction.moveTo(x: location.x, duration: 0.15))
                }
            }
            else
            {
                main.run(SKAction.moveTo(x: location.x, duration: 0.15))

            }
            
        }
    }
    
    
    
    func startGame()
    {
        //Resets both player and enemies score to 0
        score = [0,0]
        
        topLabel.text = "\(score[1])"
        bottomLabel.text = "\(score[0])"
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))


    }
    
    func addScore(winningPlayer:SKSpriteNode)
    {
        //Resetting Ball
        ball.position = CGPoint(x:0, y:0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        //Adding score and sending ball off to the player
        if winningPlayer == main
        {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 20+speedofball, dy: 20+speedofball))
        }
        else if winningPlayer == enemy
        {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20-speedofball, dy: -20-speedofball))

        }
        
        topLabel.text = "\(score[1])"
        bottomLabel.text = "\(score[0])"
    }
  
        
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        //Moves the enemy paddle to hit the ball
        //The Lower the duration, the harder the opponent
        
        var currentDateTime = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium

        theTimeRightNow.text = "\(dateFormatter.string(from: currentDateTime))"
        
        switch currentGameType {
        case .easy:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.6))
            break
        case .medium:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.4))
            break
        case .hard:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.05))
            break
        case .player2:
            break
        default:
            break
        }
        
        
        if ball.position.y <= main.position.y - 70
        {
            addScore(winningPlayer: enemy)
        }
        else if ball.position.y >= enemy.position.y + 70
        {
            addScore(winningPlayer: main)
        }
    }
}
