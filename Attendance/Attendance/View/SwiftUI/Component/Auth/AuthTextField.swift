//
//  AuthTextField.swift
//  Attendance
//
//  Created by 조병진 on 2022/11/03.
//

import SwiftUI

struct AuthTextField: View {
    @Binding var text: String
    @Binding var isError: Bool
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(text: .constant(""), isError: .constant(false), placeholder: "플레이스")
    }
}
