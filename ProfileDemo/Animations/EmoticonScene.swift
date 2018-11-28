//
//  EmoticonScene.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import SpriteKit

class EmoticonScene: SKScene {
    
    var animationBackground: SKSpriteNode!
    
    private var bear = SKSpriteNode()
    private var bearWalkingFrames: [SKTexture] = []
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0, y: 1.0)
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        
        buildBear()
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
    }
    
    func buildBear() {
        let bearAnimatedAtlas = SKTextureAtlas(named: "EmoticonSprites")
        var walkFrames: [SKTexture] = []
        
        let sprites = [1, 2, 3, 1, 1, 1, 1, 1, 1, 1]
        for i in sprites {
            let bearTextureName = "\(i)"
            walkFrames.append(bearAnimatedAtlas.textureNamed(bearTextureName))
        }
        bearWalkingFrames = walkFrames
        
        let firstFrameTexture = bearWalkingFrames[0]
        bear = SKSpriteNode(texture: firstFrameTexture)
        bear.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(bear)
    }
    
    func animateBear() {
        bear.run(SKAction.repeatForever(
            SKAction.animate(with: bearWalkingFrames,
                             timePerFrame: 0.8,
                             resize: false,
                             restore: true)),
                 withKey:"walkingInPlaceBear")
    }
    
    func stop() {
        bear.removeAllActions()
    }
    
}
