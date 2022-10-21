//
//  AnimateScreen.swift
//  Messenger
//
//  Created by Илья Меркуленко on 20.10.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct AnimateLoginScreen: View {
    var body: some View {
        AnimatedImage(name: "woman.gif")
            .resizable()
            .scaledToFill()
    }
}

struct AnimateLoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimateLoginScreen()
    }
}
