//
//  RootTabItemView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/09.
//

import UIKit

protocol RootTabItemViewDelegate: AnyObject {
    func didSelect(_ tab: PokedexTab)
}

final class RootTabItemView: XibLoadableView {

    var isSelected = false {
        willSet {
            self.tabImageView.image = newValue ? self.tab.selectedImage : self.tab.image
        }
    }

    private var tab = PokedexTab.pokemon

    private weak var delegate: RootTabItemViewDelegate?

    @IBOutlet private weak var hoverView: HoverView! {
        willSet {
            newValue.delegate = self
        }
    }

    @IBOutlet private weak var tabImageView: UIImageView!

    func setTab(_ tab: PokedexTab, delegate: RootTabItemViewDelegate?) {
        self.delegate = delegate
        self.tab = tab
    }
}

extension RootTabItemView: HoverViewDelegate {

    func didTouchUpInside() {
        self.delegate?.didSelect(self.tab)
    }
}
