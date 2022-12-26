//
//  testView.swift
//  Messenger
//
//  Created by Илья Меркуленко on 24.12.2022.
//

import SwiftUI

struct testView: View {
    @State var test = ""
    @State private var text: String = ""
    @State private var text2: String = ""
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                
                if text.isEmpty {
                    Text("Test2")
                        .bold()
                        .foregroundColor(Color.purple.opacity(0.4))
                }
                TextField("", text: $text)
            }
            .padding(.horizontal, 10).padding(.vertical, 4).overlay(
            RoundedRectangle(cornerRadius: 20).stroke(Color.teal, lineWidth: 1))
            
            TextField("", text: $text2)
                .modifier(PlaceholderStyle2(showPlaceHolder: text2.isEmpty, placeholder: "Testplace1"))
        }
        
    }
}

public struct PlaceholderStyle2: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .bold()
                    .foregroundColor(Color.purple.opacity(0.4))
            }
            content
            .foregroundColor(Color.black)
            .padding(3.0)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 1)
        .overlay(
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.teal, lineWidth: 1))
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
