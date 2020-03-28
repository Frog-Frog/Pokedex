//
//  UIView+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import UIKit

// MARK: - Add Constraints
extension UIView {

    func fitToSelf(childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["childView": childView]
        self.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat : "H:|[childView]|",
                options          : [],
                metrics          : nil,
                views            : bindings
        ))
        self.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat : "V:|[childView]|",
                options          : [],
                metrics          : nil,
                views            : bindings
        ))
    }
}

// MARK: - nib
extension UIView {

    static var nib: UINib {
        let bundle = Bundle(for: self.self)
        return UINib(nibName: self.className, bundle: bundle)
    }

    var nib: UINib {
        return type(of: self).nib
    }
}

// MARK: - class name
extension UIView {

    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

// MARK: - Layer
extension UIView {

    @IBInspectable var borderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            guard let cgColor = self.layer.borderColor else {
                return .clear
            }
            return UIColor(cgColor: cgColor)
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
}
