//
//  BorderButton.swift
//  Calculator
//
//  Created by Rodrigo Gonzalez on 6/18/17.
//  Copyright © 2017 RG. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.blue.cgColor
    }
}
