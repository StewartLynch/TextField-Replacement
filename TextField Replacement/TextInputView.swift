//
//  TextInputView.swift
//  My Stuff
//
//  Created by Stewart Lynch on 2021-10-19.
//

import SwiftUI

struct TextInputView: View {
    @Environment(\.sizeCategory) var sizeCategory
    var title: String
    @Binding var text: String
    var isSecure = false
    var offSet: Double {
        switch sizeCategory {
        case .extraSmall:
            return -27
        case .small:
            return -27 //
        case .medium:
            return -28
        case .large:
            return -30 //
        case .extraLarge:
            return -33 //
        case .extraExtraLarge:
            return -35 //
        case .extraExtraExtraLarge:
            return -40 //
        case .accessibilityMedium:
            return -45 //
        case .accessibilityLarge:
            return -50 //
        case .accessibilityExtraLarge:
            return -55 // Good
        case .accessibilityExtraExtraLarge:
            return -65 //
        case .accessibilityExtraExtraExtraLarge:
            return -70
        @unknown default:
            return -33
        }
    }
    
    var paddingTop: Double {
        switch sizeCategory {
        case .extraSmall:
            return 18
        case .small:
            return 18
        case .medium:
            return 20
        case .large:
            return 22
        case .extraLarge:
            return 24
        case .extraExtraLarge:
            return 25
        case .extraExtraExtraLarge:
            return 28
        case .accessibilityMedium:
            return 30
        case .accessibilityLarge:
            return 35
        case .accessibilityExtraLarge:
            return 40
        case .accessibilityExtraExtraLarge:
            return 43
        case .accessibilityExtraExtraExtraLarge:
            return 45
        @unknown default:
            return 25
        }
    }
    
    init(_ title: String, text: Binding<String>, isSecure: Bool = false) {
        self.title = title
        self._text = text
        self.isSecure = isSecure
    }
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(text.isEmpty ? Color(.placeholderText) : Color(.secondaryLabel))
                .offset(y: text.isEmpty ? 0 : offSet)
                .scaleEffect(text.isEmpty ? 1 : 0.8, anchor: .leading)
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
        .padding(.top, text.isEmpty ? 10 : paddingTop)
        .animation(.default, value: text)
    }
}

