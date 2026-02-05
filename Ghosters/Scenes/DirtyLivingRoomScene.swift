import SpriteKit
import Foundation

final class DirtyLivingRoomScene: SKScene {
    private let room: Room
    private var backgroundNode: SKSpriteNode?

    init(room: Room) {
        self.room = room
        // Start with a generic size; we will fix it in didMove
        super.init(size: .zero)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.scaleMode = .resizeFill // Better for matching SwiftUI bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        // This is the moment the scene knows its real size
        self.size = view.bounds.size
        setupBackground()
    }

    private func setupBackground() {
        backgroundNode?.removeFromParent()
        
        let bg = SKSpriteNode(imageNamed: room.backgroundImage)
        bg.zPosition = -100
        bg.position = .zero
        
        // FORCED FILL LOGIC:
        // We calculate the ratio needed to cover the scene width and height
        let wRatio = self.size.width / bg.size.width
        let hRatio = self.size.height / bg.size.height
        
        // Use 'max' to Aspect Fill (no gaps, some cropping)
        // Use 'min' to Aspect Fit (no cropping, might have gaps)
        let fillScale = max(wRatio, hRatio)
        
        bg.setScale(fillScale)
        
        self.backgroundNode = bg
        addChild(bg)
    }
}
