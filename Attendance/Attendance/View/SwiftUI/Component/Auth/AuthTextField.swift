//
//  AuthTextField.swift
//  Attendance
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct AuthTextField: View {
    @State private var isShow = true
    @Binding var text: String
    @Binding var isError: Bool
    let placeholder: String
    let isSecret: Bool
    let message: String
    
    init(
        placeholder: String,
        isSecret: Bool = false,
        text: Binding<String>,
        message: String = "",
        isError: Binding<Bool> = .constant(false)
    ) {
        self.placeholder = placeholder
        self.isSecret = isSecret
        self._text = text
        self.message = message
        self._isError = isError
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .trailing) {
                HStack {
                    if isSecret ? !isShow : true {
                        TextField(
                            placeholder,
                            text: $text
                        )
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    } else {
                        SecureField(
                            placeholder,
                            text: $text
                        )
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    }
                }
                .padding(17)
                .background(.white)
                .cornerRadius(8)
                .shadow(color: .gray, radius: 2,x: 1, y: 1)
                
                if isSecret {
                    Button {
                        self.isShow.toggle()
                    } label: {
                        Image(isShow ? "eye" : "eye")
                    }
                    .frame(width: 25, height: 25)
                    .padding(.trailing, 10)
                }
            }
            if isError {
                HStack {
                    Text(message)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.top, 8)
                        .padding(.leading, 12)
                    Spacer()
                }
            }
        }
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(
            placeholder: "로그인",
            isSecret: false,
            text: .constant("sadf"),
            message: "에러",
            isError: .constant(false)
        )
    }
}
