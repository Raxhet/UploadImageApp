import SwiftUI

struct StorePages {
    var pages: [Page] = []

    init() {
        var newPage = Page()
        newPage.title = "Home Test"
        pages.append(newPage)
    }
    
    mutating func addPage(title: String){
        var newPage2 = Page()
        newPage2.title = title
        pages.append(newPage2)
        print("title: \(newPage2.title) + count: \(pages.count)")
        sortPages()
    }
    
    mutating func sortPages() {
        pages.sort {
            $0.title < $1.title
        }
    }
    
}
