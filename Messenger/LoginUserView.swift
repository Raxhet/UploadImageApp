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
    //@StateObject var user = UserStateViewModel()
    
    @EnvironmentObject var vm: UserStateViewModel
    @StateObject var user = UserStateViewModel()
    
    
    var body: some View {
        VStack{
            HStack {
                Text("Log In")
            }
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .frame(width: 280, height: 45, alignment: .center)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .frame(width: 280, height: 45, alignment: .center)
            
            Button(action: {
                //vm.signInUser(email: email, password: password)
                user.signInUser(email: email, password: password)
            }) {
                Text("Sign up")
                    .foregroundColor(!signInProcessing ? .white : .gray)
                    .frame(width: 280, height: 45, alignment: .center)
                    .background(.blue)
                    .cornerRadius(8)
                    .padding()
            }
            .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
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
