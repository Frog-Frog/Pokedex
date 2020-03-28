//
//  PokemonDetailPokemonTypeCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/20.
//

import Domain
import UIKit

final class PokemonDetailPokemonTypeCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView! {
        willSet {
            newValue.register(PokemonDetailPokemonTypeItemCell.self)
        }
    }

    private var types = [PokemonDetailData.PokemonType]()

    func setData(_ types: [PokemonDetailData.PokemonType]) {
        self.types = types
        self.collectionView.reloadData()
    }
}

extension PokemonDetailPokemonTypeCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.types.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokemonDetailPokemonTypeItemCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setData(self.types[indexPath.item])
        return cell
    }
}
