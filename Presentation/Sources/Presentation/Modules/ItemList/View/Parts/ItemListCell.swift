//
//  ItemListCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Domain
import UIKit

protocol ItemListCellDelegate: AnyObject {
    func didTapItemListCell(item: Item)
}

final class ItemListCell: UITableViewCell {

    @IBOutlet private weak var itemView: ItemView!

    private weak var delegate: ItemListCellDelegate?

    func setItem(_ item: Item, delegate: ItemListCellDelegate) {
        self.delegate = delegate
        self.itemView.setItem(item, delegate: self)
    }

    func abbreviate() {
        self.itemView.abbreviate()
    }

    func expand() {
        self.itemView.expand()
    }
}

// MARK: - ItemViewDelegate
extension ItemListCell: ItemViewDelegate {

    func didTapItemView(_ item: Item) {
        self.delegate?.didTapItemListCell(item: item)
    }
}
