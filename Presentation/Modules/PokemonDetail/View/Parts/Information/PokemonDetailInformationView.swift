//
//  PokemonDetailInformationView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/18.
//

import Domain
import UIKit

final class PokemonDetailInformationView: XibLoadableView {

    @IBOutlet private weak var stackView: UIStackView!

    init(_ information: PokemonDetailModel.Information) {
        super.init(frame: .zero)
        let itemViews = information.types.map { PokemonDetailInformationItemView($0) }
        itemViews.forEach { self.stackView.addArrangedSubview($0) }
    }

    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError("init?(frame: CGRect) has not been implemented. Please use init(_ information: PokemonDetailModel.Information) instead.")
    }

    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented. Please use init(_ information: PokemonDetailModel.Information) instead.")
    }
}
