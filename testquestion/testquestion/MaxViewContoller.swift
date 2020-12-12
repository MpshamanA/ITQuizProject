import UIKit

class MaxViewContoller: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var life: UILabel!
    @IBOutlet weak var questions: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var textAnswer: UITextField!
    @IBOutlet weak var decision: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textAnswer.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textAnswer.resignFirstResponder()
        answer.text = textAnswer.text
        return true
    }
        // キーボード以外タップで閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        answer.text = textAnswer.text
        self.view.endEditing(true)
    }
    
}
