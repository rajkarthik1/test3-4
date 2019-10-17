//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
//  Sprites  outlet
     var player:SKSpriteNode!
     let PLAYER_SPEED:CGFloat = 20
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        // initialze the player
               self.player = self.childNode(withName: "player") as! SKSpriteNode
    
   
//    func didBegin(_ contact: SKPhysicsContact) {
//        print("Something collided!")
    // get all your enemy sprites (TESTING)
    let moveLeftAction = SKAction.moveBy(
        x: -400, y: 0, duration: 15)
//    self.enumerateChildNodes(withName: "enemy") {
//        (node, stop) in
//        let enemy = node as! SKSpriteNode
//        enemy.run(moveLeftAction)
    }
    
   
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    // detect when collision occurs
 func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // GET THE POSITION WHERE THE MOUSE WAS CLICKED
        // ---------------------------------------------
        let mouseTouch = touches.first
        if (mouseTouch == nil) {
            return
        }
        let location = mouseTouch!.location(in: self)

        // WHAT NODE DID THE PLAYER TOUCH
        // ----------------------------------------------
        let nodeTouched = atPoint(location).name
        //print("Player touched: \(nodeTouched)")
        
        
        // GAME LOGIC: Move player based on touch
        if (nodeTouched == "UP") {
            // move up
            self.player.position.y = self.player.position.y + PLAYER_SPEED
        }
        else if (nodeTouched == "DOWN") {
            // move down
             self.player.position.y = self.player.position.y - PLAYER_SPEED
        }
        else if (nodeTouched == "LEFT") {
            // move left
             self.player.position.x = self.player.position.x - PLAYER_SPEED
        }
        else if (nodeTouched == "RIGHT") {
            // move right
             self.player.position.x = self.player.position.x + PLAYER_SPEED
        }
    }
}


