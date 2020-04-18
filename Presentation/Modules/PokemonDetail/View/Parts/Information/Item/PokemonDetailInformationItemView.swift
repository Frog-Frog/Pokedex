//
//  PokemonDetailInformationItemView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/18.
//

import Domain
import UIKit

final class PokemonDetailInformationItemView: XibLoadableView {

    @IBOutlet private weak var iconImageView: UIImageView!

    @IBOutlet private weak var nameLabel: UILabel!

    @IBOutlet private weak var valueLabel: UILabel!

    init(_ type: PokemonDetailModel.Information.`Type`) {
        super.init(frame: .zero)
        self.iconImageView.image = type.iconImage
        self.nameLabel.text = type.name
        self.valueLabel.text = type.value
    }

    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError("init?(frame: CGRect) has not been implemented. Please use init(_ type: PokemonDetailModel.Information.`Type`) instead.")
    }

    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented. Please use init(_ type: PokemonDetailModel.Information.`Type`) instead.")
    }
}

private extension PokemonDetailModel.Information.`Type` {

    var iconImage: UIImage {
        switch self {
        case .pokemonTypes:
            return Asset.iconPokemonType.image
        case .height,
             .weight:
            return Asset.iconBody.image
        case .firstAbility,
             .secondAbility:
            return Asset.iconNormalAbility.image
        case .hiddenAbblity:
            return Asset.iconHiddenAbility.image
        }
    }

    var name: String {
        switch self {
        case .pokemonTypes:
            return "Type"
        case .height:
            return "Height"
        case .weight:
            return "Weight"
        case .firstAbility:
            return "Ability 1"
        case .secondAbility:
            return "Ability 2"
        case .hiddenAbblity:
            return "Hidden Ability"
        }
    }

    var value: String {
        switch self {
        case .pokemonTypes(let types):
            return types.map { $0.text }.joined(separator: " / ")
        case .height(let mHeight):
            return "\(mHeight)m"
        case .weight(let kgWeight):
            return "\(kgWeight)kg"
        case .firstAbility(let name):
            return name
        case .secondAbility(let name),
             .hiddenAbblity(let name):
            return name ?? "None"
        }
    }
}
