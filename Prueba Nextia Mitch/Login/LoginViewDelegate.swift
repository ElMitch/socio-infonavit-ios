//
//  LoginViewDelegate.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import Foundation

protocol LoginViewDelegate {
    
    func onLoginSuccess( msg: String )
    func onLoginFailure( msg: String )
    
    func makeLogin()
    
}
