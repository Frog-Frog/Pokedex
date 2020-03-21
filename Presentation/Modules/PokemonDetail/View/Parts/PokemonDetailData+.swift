//
//  PokemonDetailData+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/20.
//

import Domain
import UIKit

extension PokemonDetailData.Segment.Content {

    static var allCellType: [UITableViewCell.Type] {
        return [
            PokemonDetailKindCell.self,
            PokemonDetailImageCell.self,
            PokemonDetailPokemonTypeCell.self,
            PokemonDetailHeightCell.self,
            PokemonDetailWeightCell.self
        ]
    }

    var cellType: UITableViewCell.Type {
        switch self {
        case .kind:
            return PokemonDetailKindCell.self
        case .image:
            return PokemonDetailImageCell.self
        case .pokemonType:
            return PokemonDetailPokemonTypeCell.self
        case .height:
            return PokemonDetailHeightCell.self
        case .weight:
            return PokemonDetailWeightCell.self
        }
    }
}
