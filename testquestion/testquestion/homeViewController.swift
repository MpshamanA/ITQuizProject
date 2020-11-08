//
//  homeViewController.swift
//  testquestion
//
//  Created by ShoIwasaki on 2020/10/31.
//

import UIKit

class homeViewController: UIViewController {
    
    @IBOutlet weak var hometitle: UILabel!
    @IBOutlet weak var FirstWord: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        ダークモード無効
        self.overrideUserInterfaceStyle = .light
//        フェードインの設定
        Fadein(lavel: hometitle, starttime: 2.0, delaytime: 1.5)
        Fadein(lavel: FirstWord, starttime: 0.7, delaytime: 0.5)
        labelslideY(Labels: hometitle, DurationTime: 3.5)
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
    
    func labelslideY(Labels : UILabel, DurationTime : Double) -> Void{
        Labels.center = self.view.center
        UIView.animate(withDuration: (DurationTime), delay: 0.0, options: .curveEaseIn, animations: {
            Labels.center.y += 100.0
        }, completion: nil)
    }
}
