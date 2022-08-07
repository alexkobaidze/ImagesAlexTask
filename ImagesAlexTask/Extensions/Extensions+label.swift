//
//  Extensions+label.swift
//  ImagesAlexTask
//
//  Created by Alex on 07.08.22.
//

import Foundation
import UIKit

class labelExtensions: UILabel{
    
}

extension UILabel {
    class func attributedLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }
}
