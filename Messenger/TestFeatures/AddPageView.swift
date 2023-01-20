import SwiftUI
import Firebase
import FirebaseStorage

struct AddPageView: View {
    
    @State private var textField: String = ""
    @Binding var text: StorePages
    @Environment (\.dismiss) var dismiss
    var newPage = Page()
    
    var body: some View {
        VStack {
            Text(String(describing: text.pages.count))
            Text("Add folder name")
                .font(.headline)
            TextField("Name", text: $textField)
                .border(.black)
                .padding(.vertical)
            HStack {
                
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                
                Button {
                    text.addPage(title: textField)
                    dismiss()
                } label: {
                    Text("Add")
                }

            }
        }
        .padding()
    }
}

struct FolderName {
    var name: String = "new folder"
}

func upload() {
    
}

struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView(text: .constant(StorePages()))
    }
}
