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
        get {
            guard let cgColor = self.layer.borderColor else {
                return .clear
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }

    /// 影のサイズ
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }

    /// 影の透明度
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }

    /// 影の色
    @IBInspectable var shadowColor: UIColor {
        get {
            guard let cgColor = self.layer.shadowColor else {
                return .clear
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }

    /// ぼかしの量
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
}

// MARK: Autolayout Animation
extension UIView {

    func autolayoutAnimation(withDuration duration: TimeInterval = 0.3,
                             delay: TimeInterval = 0.3,
                             options: UIView.AnimationOptions = [],
                             layoutAction: () -> Void,
                             completion: (() -> Void)?) {
        self.layoutIfNeeded()

        layoutAction()

        UIView.animate(withDuration: duration, delay: delay, options: options) {
            self.layoutIfNeeded()
        } completion: { _ in
            completion?()
        }
    }
}
