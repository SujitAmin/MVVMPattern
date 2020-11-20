//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Sujit Amin on 1/15/21.
//  Copyright © 2021 Sujit Amin. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField : UITextField {
    var textChangeClosure : (String) -> () = { _ in }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    @objc func textFieldChange(_ textField: UITextField) {
        if let text = textField.text {
            self.textChangeClosure(text)
        }
    }
    func bind(callback : @escaping (String) -> ()) {
        self.textChangeClosure = callback
    }
}
