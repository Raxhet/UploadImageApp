//
//  AllView.swift
//  Messenger
//
//  Created by Илья Меркуленко on 22.10.2022.
//

import SwiftUI

struct AllView: View {
    @EnvironmentObject var viewRouter: ViewRouter
        
        var body: some View {
            switch viewRouter.currentPage {
            case .loginPage:
                LoginScreen()
            case .signUpPage:
                SignUpView()
            case .signInPage:
                LoginUserView()
            case .homePage:
                HomePage()
            }
        }
}

struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView().environmentObject(ViewRouter())
    }
}
