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
