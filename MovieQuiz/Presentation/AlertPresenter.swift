//
//  AlertPresentor.swift
//  MovieQuiz
//
//  Created by Артур Гайфуллин on 15.11.2023.
//

import UIKit

final class AlertPresenter: AlertPresenterProtocol {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    func presentAlert(model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        
        alert.view.accessibilityIdentifier = model.accessbilityIdentifier
        
        let action = UIAlertAction(
            title: model.buttonText,
            style: .default
        ) { _ in model.completion() }
        
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
