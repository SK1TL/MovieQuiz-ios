//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Артур Гайфуллин on 14.11.2023.
//

import Foundation

protocol QuestionFactoryProtocol {
    func requestNextQuestion() -> QuizQuestion?
}
