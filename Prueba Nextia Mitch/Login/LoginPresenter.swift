//
//  LoginPresenter.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import Foundation

class LoginPresenter: LoginPresenterDelegate {

    
    
    private var viewDelegate: LoginViewDelegate
    
    init(viewDelegate: LoginViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
   
    func doLogin(email: String, password: String) {
        do {
            let credentials = Credentials(user: UserCredentials(email: email, password: password))
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(credentials)
            let parameters = String(data: jsonData, encoding: .utf8)
            API.shared.makePostCall(endPoint: "login", parameters: parameters!) { (result: Result<LoginSuccess, Error>) in
                switch result {
                case .success(let loginRes):
                    if let error = loginRes.error {
                        self.viewDelegate.onLoginFailure(msg: error)
                    }
                    if loginRes.member != nil {
                        self.viewDelegate.onLoginSuccess(msg: "Credenciales correctas, bienvenido")
                    }
                case .failure(let err):
                    print("Error: \(err.localizedDescription)")
                    self.viewDelegate.onLoginFailure(msg: err.localizedDescription)
                }
            }
        } catch  {
            print("Error: al convertir credentials")
            self.viewDelegate.onLoginFailure(msg: "Error: al convertir credentials")
        }
    }
    
    
}
