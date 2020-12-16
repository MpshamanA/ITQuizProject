import UIKit

class MaxViewContoller: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var life: UILabel!
    @IBOutlet weak var questions: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var textAnswer: UITextField!
    @IBOutlet weak var decision: UIButton!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var nextbutton: UIButton!
    
    var scoreNum = 0
   lazy var Question = Questions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textAnswer.delegate = self
        self.overrideUserInterfaceStyle = .light
        round.isHidden = true
        nextbutton.isHidden = true
        QuestionFrame()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textAnswer.resignFirstResponder()
        answer.text = textAnswer.text
        textAnswer.text = ""
        return true
    }
    func QuestionFrame(){
        self.questions.layer.borderWidth = 2.0
        self.questions.layer.borderColor = UIColor.gray.cgColor
        // 角の半径
        self.questions.layer.cornerRadius = 20.0
        // この設定を入れないと角丸にならない
        self.questions.clipsToBounds = true
        
        if scoreNum == 0{
            Question.levelMax(questions: questions, question: "遅れている", answer: "ビハインド")
        }else if scoreNum == 1{
            Question.levelMax(questions: questions, question: "2問目", answer: "テスト")
        }
    }
    @IBAction func ConfirmAction(_ sender: Any) {
        if answer.text == Question.answers{
            scoreNum += 1
            score.text = "SCORE:\(scoreNum)"
            round.isHidden = false
            nextbutton.isHidden = false

            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.repeat], animations: {
                self.answer.frame.origin.x -= 50.0
            }, completion: nil)
        }
    }
    @IBAction func nextAction(_ sender: Any) {
        QuestionFrame()
        nextbutton.isHidden = true
        round.isHidden = true
        answer.text = "答えを入力"
        
    }
    
}
