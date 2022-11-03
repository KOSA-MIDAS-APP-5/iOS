import Foundation
import Moya

class LogInViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var isSucced: Bool = false
    let userClient = MoyaProvider<UserService>(plugins: [MoyaLoggerPlugin()])
    
    func login() {
        userClient.request(.logIn(name: name, password: password)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200...201:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(LoginModel.self, from: result.data) {
                            Token.accessToken = data.accessToken
                            self.isSucced = true
                            print("✅로그인 성공")
                        } else {
                            print("⚠️login docoder error")
                        }
                    }
                
                default:
                    print("error")
                }
            case .failure(let err):
                print("⛔️login error: \(err.localizedDescription)")
            }
        }
    
    }
}
