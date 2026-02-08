import SwiftUI
import SpriteKit

struct RoomView: View {
    let roomType: RoomType
        
        var body: some View {
            GeometryReader { geometry in
                SpriteView(scene: createScene(size: geometry.size))
                    .ignoresSafeArea()
            }
            .navigationTitle(roomType.name)
        }
        
        private func createScene(size: CGSize) -> RoomScene {
            let scene = RoomScene(size: size)
            scene.scaleMode = .aspectFill
            scene.backgroundImage = roomType.backgroundImage
            scene.furnitureList = roomType.furniture
            return scene
        }
}

#Preview {
    RoomView(roomType: .bedroom)
}
