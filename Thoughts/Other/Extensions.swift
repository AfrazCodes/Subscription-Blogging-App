//
//  Extensions.swift
//  Thoughts
//
//  Created by Afraz Siddiqui on 7/21/21.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        frame.size.width
    }

    var height: CGFloat {
        frame.size.height
    }

    var left: CGFloat {
        frame.origin.x
    }

    var right: CGFloat {
        left + width
    }

    var top: CGFloat {
        frame.origin.y
    }

    var bottom: CGFloat {
        top + height
    }
}
