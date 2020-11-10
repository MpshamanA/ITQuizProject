//
//  Level3ViewController.swift
//  testquestion
//
//  Created by ShoIwasaki on 2020/11/03.
//

import UIKit

class Level3ViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var life: UILabel!
    
    
    var collectAnswer = String()
    var scoreNum : Int = 0
    var lifeNum : Int = 2
    
    let screenWidth:CGFloat = CGFloat(Float(UIScreen.main.bounds.size.width))
    let screenHeight:CGFloat = CGFloat(Float(UIScreen.main.bounds.size.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Questions()
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
    }
    
    //    hide()の場合非表示する
    func hide(){
        self.round?.isHidden = true
        self.endLabel?.isHidden = true
    }
    //    unhide()の場合表示する
    func unhide(){
        self.endLabel?.isHidden = false
    }
    //    正解時のラベル設定
    func correct(){
        self.endLabel?.isHidden = true
        self.round?.isHidden = false
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
            self.performSegue(withIdentifier: "ClearScreen3", sender: self)
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
            self.performSegue(withIdentifier: "gameover3", sender: self)
        }
    }
    
    func NextAction(){
        Questions()
        hide()
    }
    func mondai(mainQuestion: String, answer1: String, answer2: String, answer3: String, collectNum: String){
        question?.text = "\(mainQuestion)"
        button1?.setTitle("\(answer1)", for: UIControl.State.normal)
        button2?.setTitle("\(answer2)", for: UIControl.State.normal)
        button3?.setTitle("\(answer3)", for: UIControl.State.normal)
        collectAnswer = "\(collectNum)"
    }
    
    func Questions(){
        self.question.layer.borderWidth = 2.0
        self.question.layer.borderColor = UIColor.gray.cgColor
        // 角の半径
        self.question.layer.cornerRadius = 20.0
        // この設定を入れないと角丸にならない
        self.question.clipsToBounds = true
        self.Next.isHidden = true
        
        //        スコアと問題を紐付け
        if scoreNum == 0{
            mondai(mainQuestion: "改定 修正", answer1: "リバイズ", answer2: "シェア", answer3: "オーナー", collectNum: "1")
        }else if scoreNum == 1{
            mondai(mainQuestion: "最終決定", answer1: "レイヤー", answer2: "フィックス", answer3: "アジャイル", collectNum: "2")
        }else if scoreNum == 2{
            mondai(mainQuestion: "下書き", answer1: "ドラフト", answer2: "アドオン", answer3: "アドレス", collectNum: "1")
        }else if scoreNum == 3{
            mondai(mainQuestion: "予算", answer1: "バジェット", answer2: "コンフリクト", answer3: "スキーム", collectNum: "1")
        }else if scoreNum == 4{
            mondai(mainQuestion: "合意", answer1: "ドラック", answer2: "ピヴォット", answer3: "コンセンサス", collectNum: "3")
        }else if scoreNum == 5{
            mondai(mainQuestion: "主導権", answer1: "リバイズ", answer2: "トラック", answer3: "イニシアチブ", collectNum: "3")
        }else if scoreNum == 6{
            mondai(mainQuestion: "余裕", answer1: "バッファ", answer2: "ワーク", answer3: "ディスコン", collectNum: "1")
        }else if scoreNum == 7{
            mondai(mainQuestion: "途中経過の節目", answer1: "スキーム", answer2: "マイルストーン", answer3: "インスコ", collectNum: "2")
        }else if scoreNum == 8{
            mondai(mainQuestion: "範囲", answer1: "ロールバック", answer2: "プッシュ", answer3: "スコープ", collectNum: "3")
        }else{
            mondai(mainQuestion: "正規の社員", answer1: "リーン", answer2: "イグジット", answer3: "プロパー", collectNum: "3")
        }
        
    }
    @IBAction func buttonAction1(_ sender: Any) {
        if collectAnswer == "1"{
            correctAction()
        }else{
            self.endLabel.text = "違うよ。。"
            self.lifeNum -= 1
            self.life.text = "LIFE:\(lifeNum)"
            unhide()
            gameover()
            life1()
        }
    }
    @IBAction func buttonAction2(_ sender: Any) {
        if collectAnswer == "2"{
            correctAction()
        }else{
            self.endLabel.text = "違うよ。。"
            self.lifeNum -= 1
            self.life.text = "LIFE:\(lifeNum)"
            unhide()
            gameover()
            life1()
        }
    }
    @IBAction func buttonAction3(_ sender: Any) {
        if collectAnswer == "3"{
            correctAction()
        }else{
            self.endLabel.text = "違うよ。。"
            self.lifeNum -= 1
            self.life.text = "LIFE:\(lifeNum)"
            self.unhide()
            gameover()
            life1()
        }
    }
    @IBAction func NextAction(_ sender: Any) {
        NextAction()
        unhidebutton()
    }
}
