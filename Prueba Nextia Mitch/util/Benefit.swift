//
//  Benefit.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import Foundation

struct BenefitsResponse: Codable {
    let locked: [Benefit]?
    let unlocked: [Benefit]?
}

struct Benefit: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let title: String?
    let instructions: String?
    let expiration_date: String?
    let active: Bool?
    let primary_color: String?
    let has_coupons: Bool?
    let vector_file_name: String?
    let vector_full_path: String?
    let slug: String?
    var wallet: Wallet?
    let territories: [Territorie]?
    let ally: Ally?
    var status: String? // locked | unlocked
}

struct Territorie: Codable {
    let id: Int?
    let name: String?
    let clave: String?
    let created_at: String?
    let updated_at: String?
}

struct Ally: Codable {
    let id: Int?
    let name: String?
    let slug: String?
    let mini_logo_file_name: String?
    let mini_logo_full_path: String?
}
