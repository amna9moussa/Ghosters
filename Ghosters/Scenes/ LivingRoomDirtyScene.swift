import SpriteKit

final class LivingRoomDirtyScene: SKScene {

    private let room: Room

    // 🔑 Sketch artboard size (LOCKED)
    private let designSize = CGSize(width: 420, height: 912)

    // 🔑 World container (everything lives here)
    private let worldNode = SKNode()

    init(room: Room, size: CGSize) {
        self.room = room
        super.init(size: size)
        scaleMode = .resizeFill
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {

        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundColor = .black

        // =========================
        // WORLD SCALE (LOCKED)
        // =========================
        let bgTemp = SKSpriteNode(imageNamed: room.backgroundImage)

        let scaleX = size.width / bgTemp.size.width
        let scaleY = size.height / bgTemp.size.height
        let baseScale = max(scaleX, scaleY)
        let zoomMultiplier: CGFloat = 2.0

        let worldScale = baseScale * zoomMultiplier

        worldNode.setScale(worldScale)
        addChild(worldNode)

        // =========================
        // BACKGROUND (DO NOT TOUCH ❌)
        // =========================
        let bg = SKSpriteNode(imageNamed: room.backgroundImage)
        bg.position = .zero
        bg.zPosition = 0
        worldNode.addChild(bg)

        // =========================
        // FIREPLACE (DIRTY 🔥)
        // =========================
        let fireplace = SKSpriteNode(imageNamed: "firePlace-Dirty")
        fireplace.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        // 🔑 Sketch values (PIXEL PERFECT)
        let sketchX: CGFloat = 37
        let sketchY: CGFloat = 329.44
        let sketchWidth: CGFloat = 345
        let sketchHeight: CGFloat = 240

        // 🔑 Convert Sketch → SpriteKit center coordinates
        let centerX =
            sketchX + sketchWidth / 2 - designSize.width / 2

        let centerY =
            designSize.height / 2 - (sketchY + sketchHeight / 2)

        fireplace.size = CGSize(
            width: sketchWidth,
            height: sketchHeight
        )

        fireplace.position = CGPoint(
            x: centerX,
            y: centerY
        )

        fireplace.zPosition = 10
        worldNode.addChild(fireplace)
    }
}
