# TextInputView

### A TextField Replacement

![TextInputView](Images/TextInputView.gif)

In his excellent YouTube tutorial series on **Building SwiftUI Components**, Peter Friese (@peterfriese on Twitter) demonstrated how to create a custom TextField with floating label text.  

See video at https://youtu.be/Sg0rfYL3utI

This is an enhanced implementation of that **TextInputView** that he demonstrated to include the following:

* Rounded Border TextField type styling
* SecureTextField type option
* SizeCategory handling for different size categories set by the user.

#### Installation

Rather than creating a Swift Package for this, I have chosen to offer it up simply as a custom SwiftUI view that you can use in your own projects and modify as you see fit.

To install, simply create a Swift file in your project and replace the content with the code following.

#### Configuration

##### TextField Replacement

Use as you would a TextField. 

`````swift
TextInputView("Email Address", text: $email)
`````

##### SecureField Replacement

Add the optional isSecure argument with a value of true

`````swift
TextInputView("Password", text: $password, isSecure: true)
`````

> **Note: **Do not use any textfieldStyle modifiers.  The TextInputField will always display a **roundedBorder** type of text input view.

#### TextInputView

`````swift
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
            return -27
        case .medium:
            return -28
        case .large:
            return -30
        case .extraLarge:
            return -33
        case .extraExtraLarge:
            return -35
        case .extraExtraExtraLarge:
            return -40
        case .accessibilityMedium:
            return -45
        case .accessibilityLarge:
            return -50
        case .accessibilityExtraLarge:
            return -55
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
`````



