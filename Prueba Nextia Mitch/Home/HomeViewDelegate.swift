//
//  HomeViewDelegate.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import Foundation

protocol HomeViewDelegate {
    
    func onGetOrdenedBenefitsSuccess( benefits: [OrdenedBenefit] )
    func onGetOrdenedBenefitsFailure( msg: String  )
    
}


struct OrdenedBenefit {
    
    let wallet: Wallet
    var benefits: [Benefit]
    
    
}
