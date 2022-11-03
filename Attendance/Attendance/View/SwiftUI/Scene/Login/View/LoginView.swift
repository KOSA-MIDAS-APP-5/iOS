import SwiftUI

struct LoginView: View {
    @StateObject var LoginVM = LogInViewModel()
    
    @State private var nameText: String = ""
    @State private var passwordText: String = ""
    var body: some View {
        ZStack {
            VStack(spacing: 19) {
                Spacer()
                    .frame(height: 150)
                    
                Text("출퇴근 관리 시스템")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                AuthTextField(
                    placeholder: "이름",
                    text: $LoginVM.name,
                    message: "error",
                    isError: .constant(false)
                )
                
                AuthTextField(
                    placeholder: "비밀번호",
                    isSecret: true,
                    text: $LoginVM.password,
                    message: "error",
                    isError: .constant(false)
                )
                
                HStack {
                    Spacer()
                    Button {
                        print("비밀번호 찾기")
                    } label: {
                        Text("비밀번호 찾기")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                    }
                }
                
                AuthButton(
                    title: "Login",
                    action: {
                        LoginVM.login()
                    }
                )
                .padding(.top, 15)
                Spacer()
            }
            .padding(.horizontal, 23)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
