//
//  LoginUserView.swift
//  Messenger
//
//  Created by Илья Меркуленко on 22.10.2022.
//

import SwiftUI
import Firebase

struct LoginUserView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var email = ""
    @State private var password = ""
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    @Environment(\.dismiss) var dismiss
    //@StateObject var user = UserStateViewModel()
    
    @EnvironmentObject var vm: UserStateViewModel
    @StateObject var user = UserStateViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .blur(radius: 2)
                VStack{
                    HStack {
                        Text("Log In")
                            .font(.custom(
                                "AmericanTypewriter", size: 35)
                            .weight(.black))
                            .colorInvert()
                    }
                    
                    TextField("", text: $email)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .frame(width: 270, height: 45, alignment: .center)
                        .modifier(PlaceholderStyle(showPlaceHolder: email.isEmpty, placeholder: "Email"))
                        .padding()
                        
                    
                    SecureField("", text: $password)
                        .frame(width: 270, height: 45, alignment: .center)
                        .modifier(PlaceholderStyle(showPlaceHolder: password.isEmpty, placeholder: "Password"))
                        
                    
                    Button(action: {
                        user.signInUser(email: email, password: password)
                    }) {
                        Text("Log In")
                            .foregroundColor(!signInProcessing ? .white : .gray)
                            .frame(width: 295, height: 45, alignment: .center)
                            .background(.orange)
                            .cornerRadius(20)
                            .padding()
                    }
                    .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            dismiss()
                        }
                        .foregroundColor(.orange)
                    }
            }
            }
        }
        
        
        if signInProcessing {
            ProgressView()
        }
        if !signInErrorMessage.isEmpty {
            Text("Error: \(signInErrorMessage)")
                .foregroundColor(.red)
        }
    }
    
//    func signInUser(userEmail: String, userPassword: String) {
//
//        signInProcessing = true
//
//        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//
//            guard error == nil else {
//                signInProcessing = false
//                signInErrorMessage = error!.localizedDescription
//                return
//            }
//            switch authResult {
//            case .none:
//                print("Could not sign in user.")
//                signInProcessing = false
//            case .some(_):
//                print("User signed in")
//                signInProcessing = false
//                user.firstLogin = false
//                withAnimation {
//                    viewRouter.currentPage = .homePage
//                }
//            }
//
//        }
//    }

    
}

struct LoginUserView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUserView()
    }
}
