//
//  InformationView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/11.
//

import UIKit

final class InformationView: XibLoadableView {

    @IBOutlet private weak var nameLabel: UILabel!

    @IBOutlet private weak var valueLabel: UILabel!

    func setData(_ name: String, value: String) {
        self.nameLabel.text = name
        self.valueLabel.text = value
    }
}
