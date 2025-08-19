//this final ver
import UIKit

    class ViewController: UIViewController {
        
        @IBOutlet weak var staticLubel: UILabel!
        @IBOutlet weak var questionNumberLabel: UILabel!
        @IBOutlet weak var questionTextLabel: UILabel!
        @IBOutlet weak var movieImageView: UIImageView!
        @IBOutlet weak var yesButton: UIButton!
        @IBOutlet weak var noButton: UIButton!
        
        let questions = [
            ["image": "film1",
             "text": "Рейтинг этого фильма больше 9?",
             "answer": true],
            ["image": "film2",
             "text": "Рейтинг этого фильма больше 8?",
             "answer": true],
            ["image": "film3",
             "text": "Рейтинг этого фильма больше 7?",
             "answer": true],
            ["image": "film4",
             "text": "Рейтинг этого фильма больше 6?",
             "answer": true],
            ["image": "film5",
             "text": "Рейтинг этого фильма больше 5?",
             "answer": true],
            ["image": "film6",
             "text": "Рейтинг этого фильма больше 4?",
             "answer": true],
            ["image": "film7",
             "text": "Рейтинг этого фильма больше 3?",
             "answer": true],
            ["image": "film8",
             "text": "Рейтинг этого фильма больше 2?",
             "answer": true],
            ["image": "film9",
             "text": "Рейтинг этого фильма больше 1?",
             "answer": true],
            ["image": "film10",
             "text": "Рейтинг этого фильма больше 10?",
             "answer": true]
            
        ]
        
        var currentQuestion = 0
        var score = 0

        override func viewDidLoad() {
            super.viewDidLoad()
            showQuestion()
        }
        
        func showQuestion() {
            let question = questions[currentQuestion]
            movieImageView.image = UIImage(named: question["image"] as! String)
            questionTextLabel.text = question["text"] as? String
            questionNumberLabel.text = "\(currentQuestion + 1)/\(questions.count)"
        }
        
        func checkAnswer(userAnswer: Bool) {
            let correctAnswer = questions[currentQuestion]["answer"] as! Bool
            
            if userAnswer == correctAnswer {
                score += 1
                userAnswer ? (yesButton.backgroundColor = .green) : (noButton.backgroundColor = .green)
            } else {
                userAnswer ? (yesButton.backgroundColor = .red) : (noButton.backgroundColor = .red)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.nextQuestion()
            }
        }
        
        func nextQuestion() {
            yesButton.backgroundColor = .systemBlue
            noButton.backgroundColor = .systemBlue
            
            if currentQuestion < questions.count - 1 {
                currentQuestion += 1
                showQuestion()
            } else {

                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Ваш счет: \(score) из \(questions.count)",
                    preferredStyle: .alert
                )
                
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default) { _ in
                    self.currentQuestion = 0
                    self.score = 0
                    self.showQuestion()
                })
                
                present(alert, animated: true)
            }
        }
        
        @IBAction func yesButton(_ sender: UIButton) {
            checkAnswer(userAnswer: true)
        }
        
        @IBAction func noButton(_ sender: UIButton) {
            checkAnswer(userAnswer: false)
        }
    }



