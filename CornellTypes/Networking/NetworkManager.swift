//
//  NetworkManager.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/24/23.
//

import Alamofire

class NetworkManager {
    
    // Shared singleton instance
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Requests
    
    func registerUser(completion: @escaping (User) -> Void) {
        
    }
    
    func loginUser(completion: @escaping (User) -> Void) {
        
    }
    
    func logoutUser(completion: @escaping (User) -> Void) {
        
    }
    
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        
    }
    
    
}
