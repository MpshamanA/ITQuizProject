//
//  ansewrInputView.swift
//  testquestion
//
//  Created by ShoIwasaki on 2020/12/20.
//

import UIKit

class ansewrInputView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibinit()
    }
    
    private func nibinit(){
        let nib = UINib(nibName: "ansewrInputView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
