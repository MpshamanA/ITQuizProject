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
        
        
        //        配列に数字を入れシャッフル
        var questionInputNum = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        questionInputNum.shuffle()
        //        シャッフルされた配列の最初の数字を変数に代入
        let select = questionInputNum[0]
        
        
        if select == 1{
            Question.levelMax(questions: questions, question: "遅れている", answer: "ビハインド")
        }else if select == 2{
            Question.levelMax(questions: questions, question: "試験2", answer: "テスト")
        }else if select == 3{
            Question.levelMax(questions: questions, question: "試験3", answer: "テスト")
        }else if select == 4{
            Question.levelMax(questions: questions, question: "試験4", answer: "テスト")
        }else if select == 5{
            Question.levelMax(questions: questions, question: "試験5", answer: "テスト")
        }else if select == 6{
            Question.levelMax(questions: questions, question: "試験6", answer: "テスト")
        }else if select == 7{
            Question.levelMax(questions: questions, question: "試験7", answer: "テスト")
        }else if select == 8{
            Question.levelMax(questions: questions, question: "試験8", answer: "テスト")
        }else if select == 9{
            Question.levelMax(questions: questions, question: "試験9", answer: "テスト")
        }else if select == 10{
            Question.levelMax(questions: questions, question: "試験10", answer: "テスト")
        }else if select == 11{
            Question.levelMax(questions: questions, question: "試験11", answer: "テスト")
        }else if select == 12{
            Question.levelMax(questions: questions, question: "試験12", answer: "テスト")
        }else if select == 13{
            Question.levelMax(questions: questions, question: "試験13", answer: "テスト")
        }else if select == 14{
            Question.levelMax(questions: questions, question: "試験14", answer: "テスト")
        }else{
            Question.levelMax(questions: questions, question: "試験15", answer: "テスト")
        }
        
    }
    @IBAction func ConfirmAction(_ sender: Any) {
        if answer.text == Question.answers{
            scoreNum += 1
            score.text = "SCORE:\(scoreNum)"
            round.isHidden = false
            nextbutton.isHidden = false
        }
    }
    @IBAction func nextAction(_ sender: Any) {
        QuestionFrame()
        nextbutton.isHidden = true
        round.isHidden = true
        answer.text = "答えを入力"
        
    }
    
}
