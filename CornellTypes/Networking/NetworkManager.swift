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
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
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
        let endpoint = "\(baseUrl)/api/users/login/"
        
        let parameters: Parameters = [
            "username": user.username,
            "password": user.password
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
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
    
    func verifyUser(code: String, completion: @escaping (String) -> Void) {
        let endpoint = "\(baseUrl)/api/users/verify/\(code)/"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: String.self, decoder: decoder) { response in
                switch response.result {
                case .success(let code):
                    print("Successfully verified user")
                    completion(code)
                case .failure(let error):
                    print("Error in NetworkManager.verifyUser: \(error.localizedDescription)")
                }
            }
        
    }
    
    func logoutUser(user: User,completion: @escaping (User) -> Void) {
        let endpoint = "\(baseUrl)/api/users/logout/"
        
        let parameters: Parameters = [
            "Authorization": user
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success(let logout):
                    print("Successfully logged out user")
                    completion(logout)
                case .failure(let error):
                    print("Error in NetworkManager.logoutUser: \(error.localizedDescription)")
                }
            }
    }
    
    func enterMBTI(type: String, user: User, completion: @escaping (String) -> Void) {
        let endpoint = "\(baseUrl)/api/users/\(user.username)/personality/"
        
        let parameters: Parameters = [
            "personality_type": type
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: String.self, decoder: decoder) { response in
                switch response.result {
                case .success(let mbti):
                    print("Successfully assigned MBTI")
                    completion(mbti)
                case .failure(let error):
                    print("Error in NetworkManager.enterMBTI: \(error.localizedDescription)")
                }
                
            }
    }
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        let endpoint = "\(baseUrl)/api/posts"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Post].self, decoder: decoder) { response in
                switch response.result {
                case .success(let posts):
                    completion(posts)
                case .failure(let error):
                    print("Error in NetworkManager.getPosts: \(error.localizedDescription)")
                }
            }
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
