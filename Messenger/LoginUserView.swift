//
//  LoginUserView.swift
//  Messenger
//
//  Created by Илья Меркуленко on 22.10.2022.
//

import SwiftUI
import Firebase

struct LoginUserView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var color
    @StateObject var user = UserStateViewModel()
    
    let instance = HapticManager()
    
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
                            .foregroundColor(.white)
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
                            .frame(width: 295, height: 45, alignment: .center)
                            .background(!email.isEmpty && !password.isEmpty ? .orange : .gray)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding()
                    }
                    .disabled(!email.isEmpty && !password.isEmpty ? false : true)
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
}

struct LoginUserView_Previews: PreviewProvider {
    static var previews: some View {
            LoginUserView()
    }
}
