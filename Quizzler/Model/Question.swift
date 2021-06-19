//
//  Question.swift
//  Quizzler
//
//  Created by Alexey on 6/13/21.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], c: String) {
        text = q
        answer = a
        rightAnswer = c
    }
}
