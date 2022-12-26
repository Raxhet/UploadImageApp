//
//  backgroundView.swift
//  Messenger
//
//  Created by Илья Меркуленко on 24.12.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct BackgroundView: View {
    var body: some View {
        AnimatedImage(name: "bonefire.gif")
            .ignoresSafeArea()
            .scaledToFill()
    }
}

struct backgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
