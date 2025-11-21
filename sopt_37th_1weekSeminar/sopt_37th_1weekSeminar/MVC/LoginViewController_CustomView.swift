//
//  LoginViewController_CustomView
//  sopt_37th_1weekSeminar
//
//  Created by 송성용 on 11/1/25.
//

import UIKit

final class LoginViewController_CustomView: UIViewController {

    // MARK: - Properties
    private let loginView = LoginView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
    }

    // MARK: - setup
    private func setAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }

    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }

    // MARK: - Private Methods
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_MVC()
        welcomeViewController.id = loginView.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

#Preview {
    LoginViewController_CustomView()
}
