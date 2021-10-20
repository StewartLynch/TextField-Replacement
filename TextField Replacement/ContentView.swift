//
//  ContentView.swift
//  TextField Replacement
//
//  Created by Stewart Lynch on 2021-10-19.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            VStack {
                Text("TextField")
                TextField("Email Address", text: $email)
                SecureField("Password", text: $password)
            }
            .autocapitalization(.none)
            .textFieldStyle(.roundedBorder)
            .padding()
            VStack {
                Text("TextInputView")
                TextInputView("Email Address", text: $email)
                TextInputView("Password", text: $password, isSecure: true)
            }
            .autocapitalization(.none)
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
