import SwiftUI
import SpriteKit

struct DirtyLivingRoomView: View {
    // We create the scene here.
    // Using @State ensures it doesn't get reset if the view re-renders.
    @State private var scene = DirtyLivingRoomScene(room: RoomFactory.createDirtyLivingRoom())

    var body: some View {
        GeometryReader { geo in
            SpriteView(scene: scene)
                .onAppear {
                    // Force the scene to match the geometry size immediately
                    scene.size = geo.size
                }
                .ignoresSafeArea()
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}
#Preview {
    DirtyLivingRoomView()
}
