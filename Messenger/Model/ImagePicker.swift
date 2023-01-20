import Foundation
import SwiftUI
import PhotosUI
import FirebaseStorage
import FirebaseFirestore

struct ImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = PHPickerViewController
    
    @Binding var images: [UIImage]
    var selectionLimit: Int
    var filter: PHPickerFilter?
    var itemProviders: [NSItemProvider] = []
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = self.selectionLimit
        configuration.filter = self.filter
        configuration.selection = .ordered
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            if !results.isEmpty {
                parent.itemProviders = []
                parent.images = []
            }
            
            parent.itemProviders = results.map(\.itemProvider)

            DispatchQueue.main.async {
                self.loadImage()
            }
        }
        
        private func loadImage() {
            for itemProvider in parent.itemProviders {
                if itemProvider.canLoadObject(ofClass: UIImage.self) {
                    itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        if let image = image as? UIImage {
                            self.parent.images.append(image)
                            uploadPhoto(image: image)
                        } else {
                            print("Could not load image", error?.localizedDescription ?? "")
                        }
                    }
                }
            }
            
            func uploadPhoto(image: UIImage) {
                let storageRef = Storage.storage().reference()
                let path = "images/\(UUID().uuidString)"
                let fileRef = storageRef.child(path)
                let imageData = image.jpegData(compressionQuality: 0.8)
                if let data = imageData {
                    fileRef.putData(data, metadata: nil) { metadata, err in
                        if err == nil && metadata != nil {
                            let db = Firestore.firestore()
                            db.collection("images").document().setData(["url":path])
                            }
                            }
                        }
                        
                    }
                }
            }
        }

