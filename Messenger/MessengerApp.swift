//
//  MessengerApp.swift
//  Messenger
//
//  Created by Илья Меркуленко on 21.10.2022.
//

import SwiftUI
import Firebase

@main
struct MessengerApp: App {
    //@StateObject var viewRouter = ViewRouter()
    @StateObject var usvm = UserStateViewModel()
    //@StateObject var user = User()
    //@State var log = User().firstLogin //true
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //AllView().environmentObject(viewRouter)
            Switcher()
                .environmentObject(usvm)
            
//            VStack {
//                if (log) {
//                    LoginScreen()
//                } else {
//                    HomePage()
//                }
//            }
//            ContentView()
//                .onAppear() {
//                    if user.firstLogin {
//                        viewRouter.currentPage = .loginPage
//                    } else {
//                        viewRouter.currentPage = .homePage
//                    }
//                }
        }
    }
}

struct Switcher: View {
    
    @EnvironmentObject var vm: UserStateViewModel
    @State private var login = UserDefaults.standard.bool(forKey: "log")
    
    var body: some View {
        if (login) {
            HomePage()
                .environmentObject(vm)
        } else {
            LoginScreen()
                .environmentObject(vm)
        }
    }
}
