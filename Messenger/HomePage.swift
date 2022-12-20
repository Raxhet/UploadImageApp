//
//  HomePage.swift
//  Messenger
//
//  Created by Илья Меркуленко on 22.10.2022.
//

import SwiftUI

struct HomePage: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var user = UserStateViewModel()
    
    var body: some View {
        NavigationView {
            Text("Home view")
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Sign Out") {
                            user.signOutUser()
                        }
                    }
                }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
