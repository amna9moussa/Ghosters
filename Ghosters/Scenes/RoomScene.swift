import SpriteKit

class RoomScene: SKScene{
    var backgroundImage : String = ""
    var furnitureList: [Furniture] = []
    
    override func didMove(to view: SKView) {
            addBackground()
            addFurniture()
        }
    
    private func addBackground() {
            let bg = SKSpriteNode(imageNamed: backgroundImage)
            bg.position = CGPoint(x: size.width / 2, y: size.height / 2)
            
            let scaleX = size.width / bg.size.width
            let scaleY = size.height / bg.size.height
            let baseScale = max(scaleX, scaleY)
            let multiplier: CGFloat = 2.0
            bg.setScale(baseScale*multiplier)
        
//            bg.size = size //fills screen
            bg.zPosition = -1
            addChild(bg)
        }
        
    private func addFurniture() {
        for item in furnitureList {
            let sprite = SKSpriteNode(imageNamed: item.uncleanImage)
            
            sprite.position = CGPoint(
                x: size.width * item.position.x,   // If x=0.5 and width=400, position at 200
                y: size.height * item.position.y   // If y=0.3 and height=800, position at 240
            )
            sprite.zPosition = item.zPosition
            sprite.setScale(item.scale)
            sprite.name = item.id.uuidString

            // Add to screen
            addChild(sprite)
        }
    }
}
