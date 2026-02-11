//
//  GameViewController.swift
//  Ghosters
//
//  Created by Amna  on 16/08/1447 AH.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let skView = self.view as? SKView {
            // You can still load from GameScene.sks if needed:
            // if let scene = SKScene(fileNamed: "GameScene") {
            //     scene.scaleMode = .aspectFill
            //     skView.presentScene(scene)
            // }
            
            skView.ignoresSiblingOrder = true
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            // TEMPORARY ROOM CREATION
            let room = Room(
                id: UUID(),
                name: "Living Room",
                backgroundImage: "bgdirtylivingroom",
                isLocked: false,
                furnitureItems: []
            )
            
            // Present custom scene
            let scene = LivingRoomDirtyScene(room: room, size: skView.bounds.size)
            scene.scaleMode = .resizeFill
            skView.presentScene(scene)
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
}

//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
//}
