import SwiftUI

struct PageListView: View {
    
    @Binding var wiki: StorePages
    @State private var selectedPage: Page? = nil
    @State private var showAddSheet = false
    @Environment(\.editMode) private var editMode
    @State private var disableTextField = true
    
    var body: some View {
        Text("asdjkh")
        VStack {
            List {
                ForEach($wiki.pages) { $page in
                    NavigationLink(destination: PageView(page: $page),
                                   tag: page,
                                   selection: $selectedPage) {
                        TextField("", text: $page.title)
                            .disabled(disableTextField)
                            .onChange(of: editMode?.wrappedValue) { newValue in
                                if (newValue != nil) && (newValue!.isEditing) {
                                    disableTextField = false
                                }
                                else {
                                    disableTextField = true
                                }
                            }
                    }
                }
                .onDelete(perform: deletePage)
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Pages")
            Button(action: { showAddSheet = true }, label: {
                Label("Add", systemImage: "note.text.badge.plus")
            })
            Spacer()
            .sheet(isPresented: $showAddSheet) {
                AddPageView(text: $wiki)
                    .presentationDetents([.medium])
            }
        }
        .toolbar {
            EditButton()
        }
    }
    
    func deletePage(at offsets: IndexSet) {
        wiki.pages.remove(atOffsets: offsets)
    }
}
    


struct PageListView_Previews: PreviewProvider {
    static var previews: some View {
        PageListView(wiki: .constant(StorePages()))
    }
}
