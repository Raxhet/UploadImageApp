import SwiftUI
import Firebase

@main
struct MessengerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var vm = UserStateViewModel()
    var body: some Scene {
        WindowGroup {
            Switcher()
                .environmentObject(vm)
        }
    }
}

struct Switcher: View {

    @EnvironmentObject var vm: UserStateViewModel
    @State private var login = UserDefaults.standard.bool(forKey: "log")

    var body: some View {
        if (login) {
            HomePage(image: [UIImage()])
                .environmentObject(vm)
        } else {
            LoginScreen()
                .environmentObject(vm)
        }
    }
}
