//
//  Question.swift
//  Quizzler
//
//  Created by Malik on 2/23/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation // allows you to have the base functionality
class Question {
    let questionText : String;
    let answer : Bool;
    
    init(text : String, correctAnswer : Bool) {
        questionText = text;
        answer = correctAnswer;
    }
}

// Methods are a fucntion that is associated with a class
// if not then it is function
