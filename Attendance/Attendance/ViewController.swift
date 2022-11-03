import UIKit
import SnapKit
import Then
import Moya

class ViewController: UIViewController {
    @IBOutlet weak var textButton: UIButton!
    var userService = MoyaProvider<UserService>(plugins: [MoyaLoggerPlugin()])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonTap() {
//        userService.request(.signUp(name: "testUser", password: "123456")) { res in
//            switch res {
//            case .success(let result):
//                switch result.statusCode {
//                case 200:
//                    print("succes")
//                default:
//                    print(result.statusCode)
//                }
//            case .failure(_):
//                print("🆘Net error")
//            }
//        }
        
        userService.request(.logIn(name: "testUser", password: "123456")) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200:
                    print("login succes")
                default:
                    print(result.statusCode)
                }
            case .failure(_):
                print("🆘Net error")
            }
        }
    }
}

