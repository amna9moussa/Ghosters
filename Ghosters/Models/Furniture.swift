import Foundation

struct Furniture: Identifiable {
    let id = UUID()
    let name: String
    
    let uncleanImage: String // SVG Name
    let cleanedImage: String // SVG Name
    
    var isCleaned: Bool = false
    let targetScore: Int
    
    
    //optional
    var position: CGPoint         // Relative position (0.0 to 1.0)
    var zPosition: CGFloat        // Layering (0 = floor, 10 = table top)
    var scale: CGFloat            // Size mulitplier (maybe you'll never use this btw)
}
