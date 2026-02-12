import SwiftUI

class SettingsViewModel: ObservableObject {
    @AppStorage("isSoundEnabled") var isSoundEnabled: Bool = true
    @AppStorage("isHapticsEnabled") var isHapticsEnabled: Bool = true
    
    func toggleSound() {
        isSoundEnabled.toggle()
    }
    
    func toggleHaptics() {
        isHapticsEnabled.toggle()
    }
}
