import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import ImageViewer

struct GridImageVIew: View {
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var isShowing = false
    @State var images: [UIImage]
    @StateObject var imageList = FireImageModel()
    @StateObject var user = UserStateViewModel()
    @State var showImageViewer: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: layout, spacing: 10) {
                    ForEach(imageList.actualImage, id: \.self) { image in
                        Button {
                            withAnimation(.easeInOut) {
                                imageList.showImageViewer.toggle()
                            }
                        } label: {
                            ZStack {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 200)
                                    .cornerRadius(10)
                                    .shadow(color: Color.primary.opacity(0.3), radius: 1)
                            }
                        }
                    }
                }.padding(.horizontal)
                    .navigationBarTitle("Images")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                isShowing.toggle()
                            }) {
                                Image(systemName: "plus")
                            }
                            .sheet(isPresented: $isShowing, onDismiss: nil) {
                                ImagePicker(images: $images, selectionLimit: 0)
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                user.signOutUser()
                            }) {
                                Text("Sign Out")
                            }
                        }
                    }
                    .onAppear {
                        imageList.retrieveImages()
                }
            }
        }
    }
}
    

struct GridImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        GridImageVIew(images: [UIImage()])
    }
}
