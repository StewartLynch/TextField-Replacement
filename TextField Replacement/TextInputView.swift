//
//  TextInputView.swift
//  My Stuff
//
//  Created by Stewart Lynch on 2021-10-19.
//

import SwiftUI

struct TextInputView: View {
    @Environment(\.sizeCategory) var sizeCategor
    var title: String
    @Binding var text: String
    var isSecure = false
    var offset: Double {
        10
    }
    
    init(_ title: String, text: Binding<String>, isSecure: Bool = false) {
        self.title = title
        self._text = text
        self.isSecure = isSecure
    }
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(text.tfProperties.phColor)
                .offset(y: text.tfProperties.offset)
                .scaleEffect(text.tfProperties.scale, anchor: .leading)
            if isSecure {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(uiColor: UIColor.placeholderText).opacity(0.5), lineWidth: 0.5)
                .padding(-5)
        }
        .padding(.top, text.isEmpty ? 10 : 25)
        .animation(.default, value: text)
    }
}

extension String {
    struct TFProperties: Equatable {
        var offset: Double = 0
        var phColor = Color(.placeholderText)
        var scale: Double = 1
    }
    var tfProperties: TFProperties {
        if isEmpty {
            return TFProperties(offset: 0, phColor: Color(.placeholderText), scale: 1)
        } else {
            return TFProperties(offset: -33, phColor: Color(.secondaryLabel), scale: 0.8)
        }
    }
}
