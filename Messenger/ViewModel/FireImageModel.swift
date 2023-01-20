import Foundation
import SwiftUI
import FirebaseStorage
import FirebaseFirestore

class FireImageModel: ObservableObject {
    @Published var actualImage: [UIImage] = []
    @Published var showImageViewer = false
    @Published var selectedImageID: String = ""

    func retrieveImages() {
        let db = Firestore.firestore()

        db.collection("images").getDocuments { snapshot, error in
            if error == nil && snapshot != nil {
                var paths = [String]()

                for doc in snapshot!.documents {
                    paths.append(doc["url"] as! String)
                }

                for path in paths {
                    let storageRef = Storage.storage().reference()

                    let fileRef = storageRef.child(path)

                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        if error == nil && data != nil {

                            if let image = UIImage(data: data!) {
                                DispatchQueue.main.async {
                                    self.actualImage.append(image)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
