//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Артур Гайфуллин on 15.11.2023.
//

import UIKit

public struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: ((UIAlertAction) -> Void)
}
