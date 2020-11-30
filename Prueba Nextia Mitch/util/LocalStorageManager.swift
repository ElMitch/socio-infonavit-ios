//
//  LocalStorageManager.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import Foundation

class LocalStorageManager {
    
    static let shared: LocalStorageManager = LocalStorageManager()
    private let defaults = UserDefaults.standard
    private init() { }
    
    func saveJWT( jwt: String ) {
        defaults.set(jwt, forKey: "infonavit.app.ios.JWT")
    }
    
    func getJWT( completionHandler: @escaping (String) -> Void ) {
        let jwt = defaults.string(forKey: "infonavit.app.ios.JWT")
        completionHandler(jwt ?? "")
    }
    
    func removeJWT() {
        print("eliminando JWT")
        defaults.removeObject(forKey: "infonavit.app.ios.JWT")
    }
    
}
