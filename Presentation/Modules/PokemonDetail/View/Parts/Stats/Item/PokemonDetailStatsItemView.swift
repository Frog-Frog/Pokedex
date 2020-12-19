//
//  PokemonDetailStatsItemView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/18.
//

import Domain
import UIKit

final class PokemonDetailStatsItemView: XibLoadableView {

    @IBOutlet private weak var innerView: UIView!

    @IBOutlet private weak var iconImageView: UIImageView!

    @IBOutlet private weak var nameLabel: UILabel!

    @IBOutlet private weak var statusBarView: PokemonStatusBarView!

    @IBOutlet private weak var valueLabel: AnimateNumberLabel!

    private var status: PokemonStatus?

    init(_ status: PokemonStatus) {
        super.init(frame: .zero)
        self.iconImageView.image = status.type.iconImage
        self.nameLabel.text = status.type.name
        self.statusBarView.setData(status.value)
        self.status = status
    }

    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError("init?(frame: CGRect) has not been implemented. Please use init(_ status: PokemonStatus) instead.")
    }

    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented. Please use init(_ status: PokemonStatus) instead.")
    }

    func animate() {
        self.valueLabel.setData(value: self.status?.value ?? 0, animated: true)
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: false, block: { [weak self] _ in
            self?.statusBarView.animate()
        })
    }
}

private extension PokemonStatus.`Type` {

    var iconImage: UIImage {
        switch self {
        case .hp:
            return Asset.iconHitPoint.image
        case .attack:
            return Asset.iconAttack.image
        case .defense:
            return Asset.iconDefense.image
        case .specialAttack:
            return Asset.iconSpecialAttack.image
        case .specialDefense:
            return Asset.iconSpecialDefense.image
        case .speed:
            return Asset.iconSpeed.image
        }
    }

    var name: String {
        switch self {
        case .hp:
            return "HP"
        case .attack:
            return "Attack"
        case .defense:
            return "Defense"
        case .specialAttack:
            return "SP.Atk"
        case .specialDefense:
            return "SP.Def"
        case .speed:
            return "Speed"
        }
    }
}
