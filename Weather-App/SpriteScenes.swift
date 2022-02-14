//
//  SpriteScenes.swift
//  Weather-App
//
//  Created by Elliot Joseph on 08/02/2022.
//

import Foundation
import SpriteKit

class SnowScene: SKScene {
    
    let snowEmmiterNode = SKEmitterNode(fileNamed: "snow.sks")
    override func didMove(to view: SKView) {
        guard let snowEmitterNode = snowEmmiterNode else {
            print("Couldnt find file")
            return
        }
        snowEmitterNode.position = CGPoint(x: 0, y: size.height)
        snowEmitterNode.particlePositionRange = CGVector(dx: 600, dy: 800)
        snowEmitterNode.particleSize = CGSize(width: 40, height: 40)
        snowEmitterNode.particleLifetime = 2
        snowEmitterNode.particleLifetimeRange = 6
        addChild(snowEmitterNode)
    }
}



class RainScene: SKScene {
    
    let rainEmmitterNode = SKEmitterNode(fileNamed: "rain.sks")
    override func didMove(to view: SKView) {
        guard let rainEmitterNode = rainEmmitterNode else {
            print("Couldnt find file")
            return
            
        }
        rainEmitterNode.position = CGPoint(x: 0, y: size.height)
        rainEmitterNode.particlePositionRange = CGVector(dx: 600, dy: 800)
        rainEmitterNode.particleSize = CGSize(width: 25, height: 150)
        rainEmitterNode.particleLifetime = 3
        rainEmitterNode.particleLifetimeRange = 8
        addChild(rainEmitterNode)
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
            guard let rainEmitterNode = rainEmmitterNode else { return }
            rainEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
            rainEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
        }
}

class SpriteManager {
    
    static var rainEffect: SKScene {
            let scene = RainScene()
            scene.size = CGSize(width: 300, height: 400)
            scene.scaleMode = .fill
            scene.backgroundColor = .clear
            return scene
    }
    
    static var snowEffect: SKScene {
        let scene = SnowScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        scene.backgroundColor = .clear
        return scene
}
    static var emptyEffect: SKScene {
                let scene = RainScene()
                scene.size = CGSize(width: 0, height: 0)
                scene.scaleMode = .fill
                scene.backgroundColor = .clear
                return scene
        }
    
}
