//
//  ItemDetailViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

/// @mockable
protocol ItemDetailView: ShowErrorAlertView {
    func showItemDetailModel(_ model: ItemDetailModel)
}

// MARK: - Properties
final class ItemDetailViewController: UIViewController {

    var presenter: ItemDetailPresenter!

    @IBOutlet private weak var itemImageView: UIImageView!

    @IBOutlet private weak var numberLabel: UILabel!

    @IBOutlet private weak var nameLabel: UILabel!

    @IBOutlet private weak var flavorTextLabel: UILabel!

    @IBOutlet private weak var informationStackView: UIStackView!
}

// MARK: - Life cycle
extension ItemDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

// MARK: - ItemDetailView
extension ItemDetailViewController: ItemDetailView {

    func showItemDetailModel(_ model: ItemDetailModel) {
        self.itemImageView.loadImage(with: model.imageUrl)
        self.numberLabel.text = L10n.Common.number(model.number)
        self.nameLabel.text = model.name

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        self.flavorTextLabel.attributedText = NSAttributedString(string: model.flavorText, attributes: attributes)

        model.informations.forEach {
            let view = InformationView()
            view.setData($0.name, value: $0.value)
            self.informationStackView.addArrangedSubview(view)
        }
    }
}

extension ItemDetailViewController {

    @IBAction private func didTapPopButton() {
        self.presenter.didSelectPop()
    }
}

private extension ItemDetailModel.Information {

    var name: String {
        switch self {
        case .attributes:
            return L10n.ItemDetail.Information.attributes
        case .category:
            return L10n.ItemDetail.Information.category
        case .cost:
            return L10n.ItemDetail.Information.cost
        }
    }

    var value: String {
        switch self {
        case .attributes(let value):
            return value ?? ""
        case .category(let value):
            return value
        case .cost(let value):
            return value == 0 ? L10n.ItemDetail.Information.notForSale : "\(value)"
        }
    }
}
