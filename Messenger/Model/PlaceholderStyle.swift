import SwiftUI

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            HStack {
                if showPlaceHolder {
                    if placeholder == "Email" {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.title)
                    } else {
                        Image(systemName: "lock.circle.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.title)
                    }
                    
                    Text(placeholder)
                        .bold()
                        .foregroundColor(Color.gray.opacity(0.4))
                }
            }
            content
                .foregroundColor(Color.white)
                .tint(.orange)
                .padding(1.0)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 1)
        .overlay(
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.orange.opacity(0.7), lineWidth: 1))
    }
}

