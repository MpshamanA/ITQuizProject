//
//  homeViewController.swift
//  testquestion
//
//  Created by ShoIwasaki on 2020/10/31.
//

import UIKit

class homeViewController: UIViewController {
    
    @IBOutlet weak var hometitle: UILabel!
    @IBOutlet weak var samari: UILabel!
    @IBOutlet weak var onsuke: UILabel!
    @IBOutlet weak var ajenda: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
//        フェードインの設定
        Fadein(lavel: hometitle, starttime: 2.0, delaytime: 2.5)
        Fadein(lavel: samari, starttime: 0.7, delaytime: 0.5)
        Fadein(lavel: onsuke, starttime: 0.7, delaytime: 1.9)
        Fadein(lavel: ajenda, starttime: 0.7, delaytime: 1.2)
//        lavelの傾きの設定
        wordlavel(tiltLavel: samari, tilt: -30)
        wordlavel(tiltLavel: onsuke, tilt: -30)
        wordlavel(tiltLavel: ajenda, tilt: 30)
    }
    
//    lavelのフェードイン
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
