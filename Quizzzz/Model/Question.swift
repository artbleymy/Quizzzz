//
//  Question.swift
//  Quizzzz
//
//  Created by Stanislav on 26/07/2019.
//  Copyright © 2019 Stanislav Kozlov. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
