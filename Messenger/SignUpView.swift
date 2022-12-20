//
//  SignUpView.swift
//  Messenger
//
//  Created by Илья Меркуленко on 22.10.2022.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    //@EnvironmentObject var vm: UserStateViewModel
    @StateObject var user = UserStateViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State var signUpProccesing = false
    @State var signUpErrorMessage = ""
    
    var body: some View {
        VStack{
            HStack {
                Text("Create Account")
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
                //vm.signUpUser(email: email, password: password)
                user.signUpUser(email: email, password: password)
            }) {
                Text("Sign up")
                    .foregroundColor(!signUpProccesing ? .white : .gray)
                    .frame(width: 280, height: 45, alignment: .center)
                    .background(.blue)
                    .cornerRadius(8)
                    .padding()
            }
            .disabled(!signUpProccesing && !email.isEmpty && !password.isEmpty ? false : true)
        }
        if signUpProccesing {
            ProgressView()
        }
        if !signUpErrorMessage.isEmpty {
            Text("Error: \(signUpErrorMessage)")
                .foregroundColor(.red)
        }
    }
    
//    func createUser(userEmail: String, userPassword: String) {
//        
//        signUpProccesing = true
//        
//        Auth.auth().createUser(withEmail: userEmail, password: userPassword, completion: { result, error in
//            guard error == nil else {
//                print("\(error?.localizedDescription ?? " ")")
//                signUpErrorMessage = error!.localizedDescription
//                signUpProccesing = false
//                return
//            }
//            switch result {
//               case .none:
//                   print("Could not create account.")
//                   signUpProccesing = false
//               case .some(_):
//                   print("Successifully created account with email: \(result?.user.email ?? "")")
//                   signUpProccesing = false
//                   user.firstLogin = false
//                   viewRouter.currentPage = .homePage
//               }
//        })
//    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
