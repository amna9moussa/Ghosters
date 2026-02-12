import SwiftUI

// MARK: - Prompt Steps (same for every room)
enum RoomPromptStep {
    case roomIntro
    case broomIntro
    case itemSelected
    case puzzleStart
    case itemRestored
    case roomCleaned
    case upgradePhase
    case nextRoomUnlocked
}

// MARK: - Ghost Message View
struct GhostMessageView: View {

    let room: RoomType
    let step: RoomPromptStep
    let onContinue: () -> Void

    // MARK: - Message Logic
    private var message: String {
        switch (room, step) {

        // ===== Living Room =====
        case (.livingRoom, .roomIntro):
            return "This living room is dusty! Tap the broom to start cleaning."

        case (.livingRoom, .roomCleaned):
            return "Amazing! The living room is now clean!"

        case (.livingRoom, .upgradePhase):
            return "You can now upgrade furniture or play puzzles to earn coins!"

        case (.livingRoom, .nextRoomUnlocked):
            return "The bedroom is now unlocked!"

        // ===== Bedroom =====
        case (.bedroom, .roomIntro):
            return "The bedroom is messy! Let’s clean it together."

        case (.bedroom, .roomCleaned):
            return "Great job! The bedroom looks wonderful!"

        case (.bedroom, .upgradePhase):
            return "Upgrade bedroom furniture or play puzzles to earn more coins!"

        case (.bedroom, .nextRoomUnlocked):
            return "Another room is now unlocked!"

        // ===== Shared Prompts =====
        case (_, .broomIntro):
            return "Choose an item to clean. Each item unlocks a puzzle!"

        case (_, .itemSelected):
            return "You selected an item. Solve the puzzle to restore it!"

        case (_, .puzzleStart):
            return "Solve the puzzle to clean this item!"

        case (_, .itemRestored):
            return "Great job! This item has been restored!"
        }
    }

    // MARK: - UI
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                colors: [
                    Color(hex: "41235C"), // purple
                    Color(hex: "C24D32")  // orange
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                ZStack(alignment: .bottomLeading) {

                    // Speech Bubble
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.white)
                        .frame(height: 200)
                        .padding(.leading, 60)
                        .padding(.trailing, 24)

                    // Message Text
                    Text(message)
                        .font(.system(size: 23, weight: .medium))
                        .foregroundColor(.black)
                        .padding(.leading, 90)
                        .padding(.trailing, 40)
                        .padding(.bottom, 50)

                    // Ghost
                    Image("ghost")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: 10, y: 20)
                }

                Button(action: onContinue) {
                    Text("Tap to continue")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.top, 24)
                }

                Spacer().frame(height: 40)
            }
        }
    }
}

// MARK: - Hex Color Helper
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

// MARK: - Preview
#Preview {
    GhostMessageView(
        room: .livingRoom,
        step: .roomIntro,
        onContinue: {}
    )
}
