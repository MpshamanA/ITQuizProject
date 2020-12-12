import UIKit

class ruleViewController: UIViewController {
    
    var test = homeViewController()
    
    @IBOutlet weak var close: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
        close.setImage(UIImage.init(named: "close"), for: UIControl.State.normal)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
