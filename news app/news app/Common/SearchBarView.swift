//
//  SearchBarView.swift
//  news app
//
//  Created by dtrognn on 27/10/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @State private var isEditing: Bool = false

    var body: some View {
        HStack {
            searchTextField

            if isEditing {
                cancelButton
            }
        }.padding(.horizontal, AppConfig.layout.standardSpace)
    }
}

private extension SearchBarView {
    var searchTextField: some View {
        return TextField("Search", text: $text)
            .padding(AppConfig.layout.mediumSpace)
            .padding(.horizontal, AppConfig.layout.mediumSpace)
            .background(AppConfig.theme.sectionBackgroundColor)
            .cornerRadius(AppConfig.layout.standardCornerRadius)
            .onTapGesture {
                isEditing = true
            }.onSubmit {
                isEditing = false
            }
    }

    var cancelButton: some View {
        return Button {
            self.isEditing = false
            text = ""
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        } label: {
            Text("Cancel")
                .font(AppConfig.font.regular16)
                .foregroundColor(AppConfig.theme.textUnderlineColor)
        }.transition(.move(edge: .trailing))
            .animation(.default)
    }
}

#Preview {
    SearchBarView(text: .constant(""))
}
