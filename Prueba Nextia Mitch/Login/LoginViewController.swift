//
//  LoginViewController.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet var mailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    
    private var presenter: LoginPresenter!
    
    static func storyboardInstance() -> LoginViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return  storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? LoginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(viewDelegate: self)
        mailTF.addLine(position: .LINE_POSITION_BOTTOM, color: UIColor.init(red: 0.6235, green: 0.6235, blue: 0.6235, alpha: 1.0) /* #9f9f9f */, width: 0.5)
        passwordTF.addLine(position: .LINE_POSITION_BOTTOM, color: UIColor.init(red: 0.6235, green: 0.6235, blue: 0.6235, alpha: 1.0) /* #9f9f9f */, width: 0.5)
        loginButton.layer.cornerRadius = 20
        mailTF.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged) 
    
        
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if !mailTF.text!.isEmpty && !passwordTF.text!.isEmpty {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.init(red: 0.9255, green: 0.3137, blue: 0.3373, alpha: 1.0) /* #ec5056 */
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.init(red: 0.6235, green: 0.6235, blue: 0.6235, alpha: 1.0) /* #9f9f9f */
        }
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        makeLogin()
    }
    
    
    @IBAction func tfPrimaryactionTrigger(_ sender: UITextField) {
        makeLogin()
    }
    

}


extension LoginViewController: LoginViewDelegate{
    
    func makeLogin() {
        let email = mailTF.text
        let password = passwordTF.text
        self.showActivityIndicator()
        presenter.doLogin(email: email ?? "", password: password ?? "")
    }
    
    func onLoginSuccess(msg: String) {
        self.hideActivityIndicator()
            if let viewController = HomeViewController.storyboardInstance() {
            let navController = ContainerViewController()
            let mainView = viewController
            navController.viewControllers = [mainView]
            UIApplication.shared.keyWindow?.rootViewController = navController
        }
    }
    
    func onLoginFailure(msg: String) {
        self.showError(msg: msg)
        self.hideActivityIndicator()
    }

}


enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}

extension UIView {
    func addLine(position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)

        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .LINE_POSITION_TOP:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}
