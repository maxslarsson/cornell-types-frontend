//
//  User.swift
//  CornellTypes
//
//  Created by Max Larsson on 12/3/23.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let personality: String
    let bio: String
    let school: String
}
