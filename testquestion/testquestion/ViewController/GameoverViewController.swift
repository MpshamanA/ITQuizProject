import UIKit

class GameoverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
        homebuttonDecoration()
        Fadein(lavel: gameOverLabel, starttime: 2.0, delaytime: 0)
        wordlavel(tiltLavel: gameOverLabel, tilt: -30)
    }
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var homebutton: UIButton!
    
    
    func homebuttonDecoration() -> Void{
        self.homebutton.layer.borderWidth = 2.0
        self.homebutton.layer.borderColor = UIColor.white.cgColor
        self.homebutton.layer.cornerRadius = 20.0      // 角の半径
        self.homebutton.clipsToBounds = true           // この設定を入れないと角丸にならない
    }
    func Fadein(lavel : UILabel, starttime : Double, delaytime : Double){
        lavel.alpha = 0.0
        UIView.animate(withDuration: TimeInterval(starttime), delay: delaytime, options: [.curveEaseIn], animations: {
            lavel.alpha = 1.0
        }, completion: nil)
    }
    //    lavelの傾き
        func wordlavel(tiltLavel : UILabel, tilt : Double){
            tiltLavel.transform = CGAffineTransform(rotationAngle: CGFloat(tilt/180.0))
        }
}

