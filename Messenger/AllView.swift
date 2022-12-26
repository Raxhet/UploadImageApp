//
//  AllView.swift
//  Messenger
//
//  Created by Илья Меркуленко on 22.10.2022.
//

import SwiftUI

//struct AllView: View {
//    @EnvironmentObject var user: UserStateViewModel
//
//        var body: some View {
//            switch user.currentPage {
//            case .loginPage:
//                LoginScreen()
//            case .signUpPage:
//                SignUpView()
//            case .signInPage:
//                LoginUserView()
//            case .homePage:
//                HomePage()
//            }
//        }
//}
//
//struct Switcher: View {
//
//    @EnvironmentObject var vm: UserStateViewModel
//    @State private var login = UserDefaults.standard.bool(forKey: "log")
//
//    var body: some View {
//        if (login) {
//            HomePage()
//                .environmentObject(vm)
//        } else {
//            LoginScreen()
//                .environmentObject(vm)
//        }
//    }
//}
//
//struct AllView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllView()
//            .environmentObject(UserStateViewModel())
//    }
//}
