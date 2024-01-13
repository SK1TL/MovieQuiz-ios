import UIKit

protocol MovieQuizViewControllerProtocol: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func presentAlert(alertModel: AlertModel)
    func show(quiz step: QuizStepViewModel)
    func showAnswerResult(isCorrect: Bool)
}

final class MovieQuizViewController: UIViewController {
    
    private var alertPresenter: AlertPresenterProtocol?
    private var presenter: MovieQuizPresenterProtocol?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var yesButton: UIButton!
    @IBOutlet private weak var noButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertPresenter = AlertPresenter(viewController: self)
        presenter = MovieQuizPresenter(viewController: self)
        configureImageView()
    }
    
    // MARK: - Private
    
    private func configureImageView() {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 20
    }
    
    // MARK: - ActionButtons
    
    @IBAction private func yesClikedButton(_ sender: UIButton) {
        presenter?.didAnswer(isYes: true)
    }
    
    @IBAction private func noClickedButton(_ sender: UIButton) {
        presenter?.didAnswer(isYes: false)
    }
}

// MARK: - MovieQuizViewControllerProtocol

extension MovieQuizViewController: MovieQuizViewControllerProtocol {
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func presentAlert(alertModel: AlertModel) {
        alertPresenter?.presentAlert(model: alertModel)
    }
    
    func show(quiz step: QuizStepViewModel) {
        
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = step.image
        
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
        
        yesButton.isEnabled = true
        noButton.isEnabled = true
    }
    
    func showAnswerResult(isCorrect: Bool) {
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        yesButton.isEnabled = false
        noButton.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self else { return }
            self.presenter?.showNextQuestionOrResults()
        }
    }
}
