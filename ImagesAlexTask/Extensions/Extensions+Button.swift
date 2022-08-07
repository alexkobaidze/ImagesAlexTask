//
//  Extensions+Button.swift
//  ImagesAlexTask
//
//  Created by Alex on 07.08.22.
//

import Foundation
import UIKit
class ButtonExtensions: UIButton{
}

extension UIButton {
   func createRectangleButton(buttonTilte: String) {
       let button = self // changes made here
       button.setTitle(buttonTilte, for: .normal)
       button.layer.cornerRadius = 15
       button.backgroundColor = .blue
       button.tintColor = .white
   }
}
