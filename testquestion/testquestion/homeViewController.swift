import UIKit

class homeViewController: UIViewController {
    
    @IBOutlet weak var hometitle: UILabel!
    @IBOutlet weak var FirstWord: UILabel!
    
    @IBOutlet weak var level1: UIButton!
    @IBOutlet weak var level2: UIButton!
    @IBOutlet weak var level3: UIButton!
    @IBOutlet weak var levelMax: UIButton!
    @IBOutlet weak var rule: UIButton!
    
    var LevelHidden:String = "LEVEL1"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
//        フェードインの設定
        Fadein(lavel: hometitle, starttime: 2.0, delaytime: 1.5)
        Fadein(lavel: FirstWord, starttime: 0.7, delaytime: 0.5)
        labelslideY(Labels: hometitle, DurationTime: 3.5)
        levelbuttonDecoration(buttonName : level1)
        levelbuttonDecoration(buttonName : level2)
        levelbuttonDecoration(buttonName : level3)
        rule.setImage(UIImage.init(named: "rule"), for: UIControl.State.normal)

        navigationController?.navigationBar.barTintColor = .rgb(red: 192, green: 192,blue: 192)
        
        if LevelHidden == "LEVEL1"{
            level2.isEnabled = false
            level2.alpha = 0.4
            level3.isEnabled = false
            level3.alpha = 0.4
        }else if LevelHidden == "LEVEL2"{
            level2.isEnabled = true
            level3.isEnabled = false
        }else if LevelHidden == "LEVEL3"{
            level2.isEnabled = true
            level3.isEnabled = true
        }
    }
    
//    lavelのフェードイン
    func Fadein(lavel : UILabel, starttime : Double, delaytime : Double){
        lavel.alpha = 0.0
        UIView.animate(withDuration: TimeInterval(starttime), delay: delaytime, options: [.curveEaseIn], animations: {
            lavel.alpha = 1.0
        }, completion: nil)
    }

    func labelslideY(Labels : UILabel, DurationTime : Double) -> Void{
        Labels.center = self.view.center
        UIView.animate(withDuration: (DurationTime), delay: 0.0, options: .curveEaseIn, animations: {
            Labels.center.y += 100.0
        }, completion: nil)
    }
//    ボタンの装飾
    func levelbuttonDecoration(buttonName : UIButton) -> Void{
        buttonName.layer.borderWidth = 2.0
        buttonName.layer.borderColor = UIColor.gray.cgColor
        buttonName.layer.cornerRadius = 5.0      // 角の半径
        buttonName.clipsToBounds = true           // この設定を入れないと角丸にならない
    }
    
}
