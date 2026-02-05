import Foundation

struct Room: Identifiable {
    let id: UUID
    let name: String
    let backgroundImage: String   // The empty room SVG
    var isLocked: Bool
    var furnitureItems: [Furniture]
    
    // Computed property to tell the GameView if we can go to the next room
    var isFullyCleaned: Bool {
        furnitureItems.allSatisfy { $0.isCleaned }
    }
}
