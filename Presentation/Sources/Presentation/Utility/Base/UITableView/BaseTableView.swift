//
//  BaseTableView.swift
//  Presentation
//
//  Created by masaki hasegawa on 2020/09/22.
//

import Foundation
import UIKit

class BaseTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        self.delaysContentTouches = false
    }

    override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
}
