//
//  GameoverViewController.swift
//  testquestion
//
//  Created by ShoIwasaki on 2020/10/31.
//

import UIKit

class GameoverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
        homebuttonDecoration()
        labelFadein()
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
    func labelFadein() -> Void{
        self.gameOverLabel.center = self.view.center
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .autoreverse, animations: {
            self.gameOverLabel.center.y += 100.0
        }, completion: nil)
    }
    //    lavelの傾き
        func wordlavel(tiltLavel : UILabel, tilt : Double){
            tiltLavel.transform = CGAffineTransform(rotationAngle: CGFloat(tilt/180.0))
        }
}

