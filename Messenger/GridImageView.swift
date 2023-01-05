//
//  GridImageVIew.swift
//  Messenger
//
//  Created by Илья Меркуленко on 05.01.2023.
//

import SwiftUI

struct GridImageVIew: View {
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    struct Photo: Identifiable {
        var id = UUID()
        var name: String
    }
    
    let samplePhotos = (1...20).map {
        Photo(name: "coffee-\($0)")
    }
    
    var logoImage: [Image] = [
        Image("test-1.jpg"),
        Image("test-2.jpg"),
        Image("test-3.jpg")
    ]
    
    @State var isShowing = false
    @State var images: [UIImage]
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(self.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                }.padding(.horizontal)
                 .navigationBarTitle("Your Memories")
                 .toolbar {
                     ToolbarItem(placement: .navigationBarTrailing) {
                         Button(action: {
                             isShowing.toggle()
                         }) {
                             Text("Add photo")
                         }
                         .sheet(isPresented: $isShowing, onDismiss: nil) {
                             ImagePicker(images: $images, selectionLimit: 0)
                         }
                     }


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
