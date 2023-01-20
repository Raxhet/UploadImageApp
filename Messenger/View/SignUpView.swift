import SwiftUI
import Firebase

struct SignUpView: View {
    @StateObject var user = UserStateViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State var signUpProccesing = false
    @State var signUpErrorMessage = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .blur(radius: 2)
                VStack{
                    HStack {
                        Text("Create Account")
                            .font(.custom(
                                "AmericanTypewriter", size: 35)
                            .weight(.black))
                            .foregroundColor(.white)
                    }
                    TextField("", text: $email)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .frame(width: 280, height: 40, alignment: .center)
                        .modifier(PlaceholderStyle(showPlaceHolder: email.isEmpty, placeholder: "Email"))
                        .padding()
                    
                    SecureField("", text: $password)
                        .frame(width: 280, height: 40, alignment: .center)
                        .modifier(PlaceholderStyle(showPlaceHolder: password.isEmpty, placeholder: "Password"))
                    
                    Button(action: {
                        user.signUpUser(email: email, password: password)
                    }) {
                        Text("Create")
                            .frame(width: 295, height: 45, alignment: .center)
                            .background(!email.isEmpty && !password.isEmpty ? .orange : .gray)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding()
                    }
                    .disabled(!signUpProccesing && !email.isEmpty && !password.isEmpty ? false : true)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel", role: .cancel) {
                            dismiss()
                        }
                        .foregroundColor(.orange)
                    }
                }
            }
        }
        
        if signUpProccesing {
            ProgressView()
        }
        if !signUpErrorMessage.isEmpty {
            Text("Error: \(signUpErrorMessage)")
                .foregroundColor(.red)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
