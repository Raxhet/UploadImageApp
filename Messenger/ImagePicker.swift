//
//  ImagePicker.swift
//  Messenger
//
//  Created by Илья Меркуленко on 06.01.2023.
//

import Foundation
//import UIKit
import SwiftUI
import PhotosUI

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
            //Dismiss picker
            picker.dismiss(animated: true)

            if !results.isEmpty {
                parent.itemProviders = []
                parent.images = []
            }
            
            parent.itemProviders = results.map(\.itemProvider)
            loadImage()
        }
        
        private func loadImage() {
            for itemProvider in parent.itemProviders {
                if itemProvider.canLoadObject(ofClass: UIImage.self) {
                    itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        if let image = image as? UIImage {
                            self.parent.images.append(image)
                        } else {
                            print("Could not load image", error?.localizedDescription ?? "")
                        }
                    }
                }
            }
        }
        
    }
}
