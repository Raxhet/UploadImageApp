import SwiftUI

struct PageView: View {
    
    @Binding var page: Page
    
    var body: some View {
        Text("\(page.title)")
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: .constant(Page()))
    }
}
