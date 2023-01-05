//
//  User.swift
//  Messenger
//
//  Created by Илья Меркуленко on 17.12.2022.
//
import SwiftUI
import Foundation
import Firebase

@MainActor
class UserStateViewModel: ObservableObject {

    @Published var firstLogin = false

    let instance = HapticManager()
    
    func signInUser(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            switch authResult {
                case .none:
                    print("Could not sign in user.")
                case .some(_):
                    self.firstLogin = true
                    UserDefaults.standard.set(self.firstLogin, forKey: "log")
                        if let window = UIApplication.shared.windows.first { //костыль
                            window.rootViewController = UIHostingController(rootView: HomePage().transition(.fade))
                            window.makeKeyAndVisible()
                        }
                    self.instance.notification(type: .success)
            }
        }
    }
    
    func signUpUser(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
            guard error == nil else {
                print("\(error?.localizedDescription ?? " ")")
                return
            }
            switch result {
                case .none:
                    print("Could not create account.")
                case .some(_):
                    print("Successifully created account with email: \(result?.user.email ?? "")")
                    self.firstLogin = true
                    UserDefaults.standard.set(self.firstLogin, forKey: "log")
                    withAnimation {
                        if let window = UIApplication.shared.windows.first { //костыль
                            window.rootViewController = UIHostingController(rootView: HomePage())
                            window.makeKeyAndVisible()
                        }
                    }
            }
        })
    }
    
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.firstLogin = false
            UserDefaults.standard.set(self.firstLogin, forKey: "log")
            print(EmailAuthProviderID.description)
            print("success")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        withAnimation {
            if let window = UIApplication.shared.windows.first { //костыль
                window.rootViewController = UIHostingController(rootView: LoginScreen())
                window.makeKeyAndVisible()
            }
        }
    }
    
}
