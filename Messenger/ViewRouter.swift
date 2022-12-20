//
//  ViewRouter.swift
//  Messenger
//
//  Created by Илья Меркуленко on 22.10.2022.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .loginPage
}

enum Page {
    case signUpPage
    case signInPage
    case homePage
    case loginPage
}
