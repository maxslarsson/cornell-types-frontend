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
    
    func registerUser(completion: @escaping (User) -> Void) {
        
    }
    
    func loginUser(completion: @escaping (User) -> Void) {
        
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
