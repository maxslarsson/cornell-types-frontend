//
//  Question.swift
//  CornellTypes
//
//  Created by Max Larsson on 12/1/23.
//

import Foundation

struct Question: Codable {
    let id: Int
    let questionNo: Int
    let questionText: String
    let options: [QuestionOption]
}

struct QuestionOption: Codable {
    let id: Int
    let questionId: Int
    let optionText: String
}
