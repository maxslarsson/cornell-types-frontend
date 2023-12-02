//
//  NetworkManager.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/24/23.
//

import Alamofire
import Foundation

class NetworkManager {
    
    // Shared singleton instance
    static let shared = NetworkManager()
    
    // Endpoint
    private let baseUrl = "http://34.48.21.54"
    
    // JSON Decoder
    private let decoder = JSONDecoder()
    
    private init() {
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: - Requests
    
    func registerUser(user: User, completion: @escaping (User) -> Void) {
        let endpoint = "\(baseUrl)/api/users/register/"
        
        let parameters: Parameters = [
            "email": user.email,
            "username": user.username,
            "password": user.password,
            "school": user.school
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success(let user):
                    print("Successfully registered user")
                    completion(user)
                case .failure(let error):
                    print("Error in NetworkManager.registerUser: \(error.localizedDescription)")
                    
                }
            }
    }
    
    func loginUser(user: User, completion: @escaping (User) -> Void) {
        let endpoint = "\(baseUrl)/api/users/login/\(user.username)"
        
        let parameters: Parameters = [
            "email": user.email,
            "username": user.username,
            "password": user.password
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success(let user):
                    print("Successfully logged in user")
                    completion(user)
                case .failure(let error):
                    print("Error in NetworkManager.loginUser: \(error.localizedDescription)")
                }
            }
    }
    
    func logoutUser(completion: @escaping (User) -> Void) {
        
    }
    
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        
    }
    
    func getQuestion(questionId: Int, completion: @escaping (Question?) -> Void) {
        let endpoint = "\(baseUrl)/api/surveys/\(questionId)"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: Question.self, decoder: decoder) { response in
                switch response.result {
                case .success(let question):
                    completion(question)
                case .failure(let error):
                    print("Error in NetworkManager.getQuestion: \(error.localizedDescription)")
                    completion(nil)
                }
            }
    }
}
