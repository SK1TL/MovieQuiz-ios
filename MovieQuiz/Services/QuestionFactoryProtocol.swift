//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Артур Гайфуллин on 14.11.2023.
//

import Foundation
import UIKit

protocol QuestionFactoryProtocol {
    func requestNextQuestion()
    var delegate: QuestionFactoryDelegate? { get set }
}
