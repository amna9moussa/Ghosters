import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Environment(\.dismiss) var dismiss // This handles the "Exit" back navigation

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.29, green: 0.17, blue: 0.37), Color(red: 0.76, green: 0.29, blue: 0.21)]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            // Decorative Webs using your new names
            VStack {
                HStack {
                    Image("web1") // Top corner web
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Image("web2") // Bottom corner web
                        .resizable()
                        .frame(width: 150, height: 150)
                }
            }

            VStack(spacing: 40) {
                Text("Settings")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))

                // Settings Panel
                VStack(spacing: 25) {
                    settingToggleRow(title: "Sound", icon: "sound_icon", isOn: viewModel.isSoundEnabled) {
                        viewModel.toggleSound()
                    }
                    
                    settingToggleRow(title: "Haptics", icon: "haptics_icon", isOn: viewModel.isHapticsEnabled) {
                        viewModel.toggleHaptics()
                    }
                }
                .padding(30)
                .background(Color.black.opacity(0.2))
                .cornerRadius(25)
                .padding(.horizontal, 30)

                // Exit Button with Navigation back
                Button(action: {
                    dismiss() // Returns to the previous screen automatically
                }) {
                    Text("Exit")
                        .font(.title2.bold())
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.vertical, 12)
                        .padding(.horizontal, 60)
                        .background(Color.black.opacity(0.3))
                        .clipShape(Capsule())
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hides default back button for a cleaner game look
    }

    // Helper row for your custom icons
    func settingToggleRow(title: String, icon: String, isOn: Bool, action: @escaping () -> Void) -> some View {
        HStack {
            Text(title)
                .font(.title2)
                .foregroundColor(.white.opacity(0.6))
            Spacer()
            Button(action: action) {
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom))
                        .frame(width: 55, height: 55)
                        .opacity(isOn ? 1.0 : 0.4)
                    
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}


#Preview {
    // We wrap it in a NavigationView so you can see how it looks
    // when linked from your teammates' pages.
    NavigationView {
        SettingsView()
    }
}
