import UIKit

class result2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
        NextbuttonDecoration(buttonName : homeButton)
    }
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var nextLevel3: UIButton!
    
    func NextbuttonDecoration(buttonName : UIButton) -> Void{
        buttonName.layer.borderWidth = 2.0
        buttonName.layer.borderColor = UIColor.gray.cgColor
        buttonName.layer.cornerRadius = 10.0      // 角の半径
        buttonName.clipsToBounds = true           // この設定を入れないと角丸にならない
    }
    
    @IBAction func homeAction2(_ sender: Any) {
        
        performSegue(withIdentifier: "homeViewContoroller2", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeViewContoroller2" {
            let nextVC = segue.destination as! homeViewController
            nextVC.LevelHidden = "LEVEL3"
        }
    }
    
    
}
