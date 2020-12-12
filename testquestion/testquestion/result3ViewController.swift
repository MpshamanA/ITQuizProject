import UIKit

class result3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
        NextbuttonDecoration(buttonName : homeButton)
    }
    @IBOutlet weak var homeButton: UIButton!
    
    func NextbuttonDecoration(buttonName : UIButton) -> Void{
        buttonName.layer.borderWidth = 2.0
        buttonName.layer.borderColor = UIColor.gray.cgColor
        buttonName.layer.cornerRadius = 10.0      // 角の半径
        buttonName.clipsToBounds = true           // この設定を入れないと角丸にならない
    }
    
    
}
