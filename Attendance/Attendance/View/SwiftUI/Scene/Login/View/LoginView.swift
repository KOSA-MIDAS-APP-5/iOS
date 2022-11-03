import SwiftUI

struct LoginView: View {
    @State private var nameText: String = ""
    @State private var passwordText: String = ""
    var body: some View {
        VStack {
            Text("출퇴근 관리 시스템")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            TextField("이름", text: $nameText)
                .autocorrectionDisabled(true)
                .multilineTextAlignment(.leading)
                .padding(18)
                .background(.white)
                .cornerRadius(8)
                .shadow(color: .gray, radius:  2,x: 1, y: 1)
            
            TextField("비밀번호", text: $passwordText)
                .autocorrectionDisabled(true)
                .multilineTextAlignment(.leading)
                .padding(18)
                .background(.white)
                .cornerRadius(8)
                .shadow(color: .gray, radius:  2,x: 1, y: 1)
        }
        .padding(.horizontal, 23)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
