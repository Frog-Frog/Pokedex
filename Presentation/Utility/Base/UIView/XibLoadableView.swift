//
//  XibLoadableView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/28.
//

import UIKit

class XibLoadableView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialize()
    }

    private func initialize() {
        self.loadXib()
    }
}

// MARK: - LoadXib
extension XibLoadableView {

    func loadXib() {
        let bundle = Bundle(for: type(of: self))
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? {
            fatalError("Can not load xib!")
        }()
        self.addSubview(view)
        self.backgroundColor = UIColor.clear
        self.fitToSelf(childView: view)
    }
}
