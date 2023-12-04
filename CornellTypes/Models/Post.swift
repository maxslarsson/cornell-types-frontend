//
//  Post.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/24/23.
//

import Foundation

struct Post: Codable {
    let id: Int
    let text: String
    let user: String
}
