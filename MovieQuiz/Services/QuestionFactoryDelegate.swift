//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Артур Гайфуллин on 14.11.2023.
//

import Foundation
import UIKit

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
