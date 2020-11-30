//
//  MenuPresenter.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import Foundation

class MenuPresenter: MenuPresenterDelegate {
    
    private var viewDelegate: MenuViewDelegate!
    
    init(viewDelegate: MenuViewDelegate){
        self.viewDelegate = viewDelegate
    }
    
    
    func doLogout() {
        
        // mandar a llamar al endpoint
        // https://staging.api.socioinfonavit.io/api/v1/logout (DELETE)
        
        LocalStorageManager.shared.removeJWT()
        viewDelegate.onLogoutSuccess(msg: "Hasta la vista baby!")

    }
}
