import UIKit



class Questions{
    
    var collectAnswer = String()
    
    func QuestionLevel1(question: UILabel, button1: UIButton, button2: UIButton, mainQuestion: String, answer1: String, answer2: String, collectNum: String){
        
        question.text = "\(mainQuestion)"
        button1.setTitle("\(answer1)", for: UIControl.State.normal)
        button2.setTitle("\(answer2)", for: UIControl.State.normal)
        collectAnswer = "\(collectNum)"
    }
    
    func QuestionLevel2(question: UILabel, button1: UIButton, button2: UIButton,button3: UIButton, mainQuestion: String, answer1: String, answer2: String, answer3: String, collectNum: String){
        
        question.text = "\(mainQuestion)"
        button1.setTitle("\(answer1)", for: UIControl.State.normal)
        button2.setTitle("\(answer2)", for: UIControl.State.normal)
        button3.setTitle("\(answer3)", for: UIControl.State.normal)
        collectAnswer = "\(collectNum)"
    }
    
    func QuestionLevel3(question: UILabel, button1: UIButton, button2: UIButton,button3: UIButton, button4: UIButton, mainQuestion: String, answer1: String, answer2: String, answer3: String, answer4: String, collectNum: String){
        
        question.text = "\(mainQuestion)"
        button1.setTitle("\(answer1)", for: UIControl.State.normal)
        button2.setTitle("\(answer2)", for: UIControl.State.normal)
        button3.setTitle("\(answer3)", for: UIControl.State.normal)
        button4.setTitle("\(answer4)", for: UIControl.State.normal)
        collectAnswer = "\(collectNum)"
    }
}
