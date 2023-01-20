import SwiftUI
import Firebase

struct HomePage: View {
    
    @StateObject var user = UserStateViewModel()
    @StateObject var images = FireImageModel()
    let instance = HapticManager()
    @State var image: [UIImage]
    
    var body: some View {
        GridImageVIew(images: image)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(image: [UIImage()])
    }
}
