//
//  MovieQuizViewTests.swift
//  MovieQuizViewTests
//
//  Created by Артур Гайфуллин on 19.12.2023.
//

import XCTest

@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    func showLoadingIndicator() {
        
    }
    
    func hideLoadingIndicator() {
        
    }
    
    func presentAlert(alertModel: AlertModel) {
        
    }
    
    func show(quiz step: MovieQuiz.QuizStepViewModel) {
        
    }
    
    func showAnswerResult(isCorrect: Bool) {
        
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        let words: String = "Question Text"
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: words, correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, words)
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
