//
//  LoginScreen.swift
//  Messenger
//
//  Created by Илья Меркуленко on 21.10.2022.
//

import SwiftUI
import Firebase

struct LoginScreen: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var showingSheetSignUp = false
    @State private var showingSheetLogIn = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("Welcome!")
                    .foregroundColor(.white)
                    .font(.custom(
                        "AmericanTypewriter", size: 65)
                    .weight(.black))

                VStack {
                    Button(action: {
                            showingSheetSignUp.toggle()
                    }) {
                        Text("Sign up")
                            .font(.custom(
                                "AmericanTypewriter", size: 28))
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(10)
                    .sheet(isPresented: $showingSheetSignUp) {
                        SignUpView()
                    }

                    Button(action: {
                        showingSheetLogIn.toggle()
                    }) {
                        Text("Log in")
                            .font(.custom(
                                "AmericanTypewriter", size: 18))
                    }
                    .buttonStyle(.borderless)
                    .sheet(isPresented: $showingSheetLogIn) {
                        LoginUserView()
                    }
                }
                .padding(50)
            }
        }

    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
