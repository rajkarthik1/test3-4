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
    var wallblock:SKSpriteNode!
    var isblock:SKSpriteNode!
    var flagblock:SKSpriteNode!
    var stopblock:SKSpriteNode!
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        // initialze the player
        self.player = self.childNode(withName: "player") as? SKSpriteNode
        self.wallblock = self.childNode(withName: "wallblock") as? SKSpriteNode
        self.flagblock = self.childNode(withName: "flagblock") as? SKSpriteNode
        self.isblock = self.childNode(withName: "isblock") as? SKSpriteNode
        self.stopblock = self.childNode(withName: "stopblock") as? SKSpriteNode
        
            
    
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
//    if (nodeA!.name == "flag" && nodeB!.name == "player") {
//    print("CONGRATS")
//
//    }
//
//    if (nodeA!.name == "player" && nodeB!.name == "flag") {
//        print("CONGRATS")
        
//    if (nodeA!.name == "player" && nodeB!.name == "wall"){
//        return(
        
    //}
    
//    WALL IS STOP
    if (nodeA!.name == "wallblock" && nodeB!.name == "isblock") {
     print("WALL IS STOP")
    
     }
     
     if (nodeA!.name == "isblock" && nodeB!.name == "wallblock") {
         print("yess+")
    
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


