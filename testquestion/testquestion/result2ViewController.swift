import UIKit

class result2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
        NextbuttonDecoration(buttonName : homeButton)
        NextbuttonDecoration(buttonName : nextLevel3)
    }
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var nextLevel3: UIButton!
    
    
    
    func NextbuttonDecoration(buttonName : UIButton) -> Void{
        buttonName.layer.borderWidth = 2.0
        buttonName.layer.borderColor = UIColor.gray.cgColor
        buttonName.layer.cornerRadius = 10.0      // 角の半径
        buttonName.clipsToBounds = true           // この設定を入れないと角丸にならない
    }
    
}
