import Foundation

struct Page: Identifiable, Hashable, Equatable {
    let id = UUID()
    var title: String = ""
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
}
