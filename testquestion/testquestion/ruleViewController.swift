import UIKit

class ruleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
    }
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
