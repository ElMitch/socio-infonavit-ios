//
//  Credentials.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import Foundation


struct Credentials: Codable {
    let user: UserCredentials
}

struct UserCredentials: Codable {
    let email: String
    let password: String
}
