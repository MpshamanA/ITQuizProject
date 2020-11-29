import UIKit

class Level2ViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var life: UILabel!
    @IBOutlet weak var Wrong: UILabel!
    
    
    var scoreNum : Int = 0
    var lifeNum : Int = 3
    lazy var Question = Questions()
    
    let screenWidth:CGFloat = CGFloat(Float(UIScreen.main.bounds.size.width))
    let screenHeight:CGFloat = CGFloat(Float(UIScreen.main.bounds.size.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionFrame()
        hide()
        
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
        buttonDecoration(buttonName : button1)
        buttonDecoration(buttonName : button2)
        buttonDecoration(buttonName : button3)
    }
    //    全部非表示
    func allhide(){
        question.isHidden = true
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        endLabel.isHidden = true
        Next.isHidden = true
        score.isHidden = true
        round.isHidden = true
        life.isHidden = true
        Wrong.isHidden = true
    }
    
    //    hide()の場合非表示する
    func hide(){
        self.round.isHidden = true
        self.endLabel?.isHidden = true
        self.Wrong.isHidden = true
    }
    //    unhide()の場合表示する
    func unhide(){
        self.endLabel.isHidden = false
        self.Wrong.isHidden = false
    }
    //    正解時のラベル設定
    func correct(){
        self.endLabel.isHidden = true
        self.round.isHidden = false
        self.Wrong.isHidden = true
    }
    //    回答ボタン非表示
    func hidebutton(){
        self.button1.isHidden = true
        self.button2.isHidden = true
        self.button3.isHidden = true
    }
    //　　回答ボタン表示
    func unhidebutton(){
        self.button1.isHidden = false
        self.button2.isHidden = false
        self.button3.isHidden = false
    }
    //    解答ボタンの装飾
    func buttonDecoration(buttonName : UIButton) -> Void{
        buttonName.layer.cornerRadius = 10.0      // 角の半径
        buttonName.clipsToBounds = true           // この設定を入れないと角丸にならない
    }
    //    次へボタンの装飾
    func NextbuttonDecoration() -> Void{
        self.Next.layer.borderWidth = 1.0
        self.Next.layer.borderColor = UIColor.gray.cgColor
        self.Next.layer.cornerRadius = 10.0      // 角の半径
        self.Next.clipsToBounds = true           // この設定を入れないと角丸にならない
    }
    //    フェードアウト
    func Fadeout(lavel : UILabel, starttime : Double, delaytime : Double){
        lavel.alpha = 1.0
        UIView.animate(withDuration: TimeInterval(starttime), delay: delaytime, options: [.curveEaseIn], animations: {
            lavel.alpha = 0.0
        }, completion: nil)
    }
    //正解時のアクション
    func correctAction(){
        self.round.text = "○"
        self.round.textColor = UIColor.red
        self.round.font = UIFont.systemFont(ofSize: 150)
        self.round.center = CGPoint(x: screenWidth/2, y: screenHeight/2)
        self.scoreNum += 1
        self.score.text = "SCORE:\(scoreNum)"
        NextbuttonDecoration()
        self.Next.isHidden = false
        correct()
        hidebutton()
        if scoreNum >= 10{
            allhide()
            //            クリア画面に遷移
            self.performSegue(withIdentifier: "ClearScreen2", sender: self)
            self.scoreNum = 0
            self.score.text = "SCORE:\(scoreNum)"
        }
    }
    //    ライフ1の時のアクション
    func life1(){
        if lifeNum == 1 {
            //            フォントを大きくする
            self.life.font = UIFont.systemFont(ofSize: 30)
            //            フォントを点滅させる
            UIView.animate(withDuration: 0.6,
                           delay: 0.0,
                           options: .repeat,
                           animations: {
                            self.life.alpha = 0.0
                           }) { (_) in
                self.life.alpha = 1.0
            }
        }
    }
    func gameover(){
        if lifeNum == 0{
            allhide()
            self.performSegue(withIdentifier: "gameover2", sender: self)
        }
    }
    
    func NextAction(){
        QuestionFrame()
        hide()
    }
    
    func QuestionFrame(){
        self.question.layer.borderWidth = 2.0
        self.question.layer.borderColor = UIColor.gray.cgColor
        // 角の半径
        self.question.layer.cornerRadius = 20.0
        // この設定を入れないと角丸にならない
        self.question.clipsToBounds = true
        self.Next.isHidden = true
        
        //        スコアと問題を紐付け
        if scoreNum == 0{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "曖昧", answer1: "インシデント", answer2: "ファジー", answer3: "マター", collectNum: "2")
            
        }else if scoreNum == 1{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "合意", answer1: "コミット", answer2: "バグ", answer3: "アグリー", collectNum: "3")
            
        }else if scoreNum == 2{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "問題", answer1: "マター", answer2: "クロージング", answer3: "スクラッチ", collectNum: "1")
            
        }else if scoreNum == 3{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "議題", answer1: "アジェンダ", answer2: "スコープ", answer3: "リバイズ", collectNum: "1")
            
        }else if scoreNum == 4{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "保留", answer1: "アラート", answer2: "クリティカル", answer3: "ペンディング", collectNum: "3")
            
        }else if scoreNum == 5{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "差分", answer1: "ファジー", answer2: "サマリー", answer3: "ディフ", collectNum: "3")
            
        }else if scoreNum == 6{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "合併", answer1: "マージ", answer2: "デプロイ", answer3: "リリース", collectNum: "1")
            
        }else if scoreNum == 7{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "証跡", answer1: "フィックス", answer2: "エビデンス", answer3: "インシデント", collectNum: "2")
            
        }else if scoreNum == 8{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "遅れている", answer1: "ブレスト", answer2: "ビハインド", answer3: "リバイズ", collectNum: "2")
            
        }else{
            
            Question.Question(question: question, button1: button1, button2: button2, button3: button3, mainQuestion: "任命", answer1: "アサイン", answer2: "オフショア", answer3: "フィンテック", collectNum: "1")
            
        }
        
    }
    @IBAction func buttonAction1(_ sender: Any) {
        if Question.collectAnswer == "1"{
            correctAction()
        }else{
            self.endLabel.text = "違うよ。。"
            self.lifeNum -= 1
            self.life.text = "LIFE:\(lifeNum)"
            Fadeout(lavel : Wrong, starttime : 0.7, delaytime : 0.5)
            Fadeout(lavel : endLabel, starttime : 0.7, delaytime : 0.5)
            unhide()
            gameover()
            life1()
        }
    }
    @IBAction func buttonAction2(_ sender: Any) {
        if Question.collectAnswer == "2"{
            correctAction()
        }else{
            self.endLabel.text = "違うよ。。"
            self.lifeNum -= 1
            self.life.text = "LIFE:\(lifeNum)"
            Fadeout(lavel : Wrong, starttime : 0.7, delaytime : 0.5)
            Fadeout(lavel : endLabel, starttime : 0.7, delaytime : 0.5)
            unhide()
            gameover()
            life1()
        }
    }
    @IBAction func buttonAction3(_ sender: Any) {
        if Question.collectAnswer == "3"{
            correctAction()
        }else{
            self.endLabel.text = "違うよ。。"
            self.lifeNum -= 1
            self.life.text = "LIFE:\(lifeNum)"
            Fadeout(lavel : Wrong, starttime : 0.7, delaytime : 0.5)
            Fadeout(lavel : endLabel, starttime : 0.7, delaytime : 0.5)
            self.unhide()
            gameover()
            life1()
        }
    }
    @IBAction func nextAction(_ sender: Any) {
        NextAction()
        unhidebutton()
    }
}
