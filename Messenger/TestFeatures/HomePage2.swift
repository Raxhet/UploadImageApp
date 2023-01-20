import SwiftUI

struct HomePage2: View {
    @State var isShowing = false
    @State var textFolder: String = ""
    @Binding var text: StorePages
    
    //@State private var selectedPage: Page2? = nil
    
    var body: some View {
        
//        NavigationStack {
//            PageListView(wiki: $text)
//        }
        NavigationStack {
            Text(String(describing: $text.pages.count))
                .navigationTitle("Home Page")
//                .toolbar{
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//                            isShowing.toggle()
//                        } label: {
//                            Image(systemName: "plus")
//                        }
//                        .sheet(isPresented: $isShowing) {
//                            AddPageView(text: $text)
//                                .presentationDetents([.medium, .large])
//                        }
//
//                    }
//            }
        }
    }
}



struct HomePage2_Previews: PreviewProvider {
    static var previews: some View {
        HomePage2(text: .constant(StorePages()))
    }
}
