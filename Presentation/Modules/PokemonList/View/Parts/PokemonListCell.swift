//
//  PokemonListCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import Domain
import UIKit

protocol PokemonListCellDelegate: AnyObject {
    func didTapPokemonListCell(pokemon: PokemonListModel.Pokemon)
}

final class PokemonListCell: UITableViewCell {

    @IBOutlet private weak var spriteImageView: UIImageView!

    @IBOutlet private weak var innerView: HoverView! {
        willSet {
            newValue.delegate = self
        }
    }

    @IBOutlet private weak var numberLabel: UILabel!

    @IBOutlet private weak var nameLabel: UILabel!

    private var data: PokemonListModel.Pokemon?
    private weak var delegate: PokemonListCellDelegate?

    func setData(_ data: PokemonListModel.Pokemon, delegate: PokemonListCellDelegate) {
        self.data = data
        self.delegate = delegate
        self.spriteImageView.loadImage(with: data.imageUrl, placeholder: Asset.monsterball.image)
        self.numberLabel.text = "No.\(data.number)"
        self.nameLabel.text = data.name
    }

    func abbreviate() {
        let x: CGFloat = UIScreen.main.bounds.width * 0.375
        self.innerView.transform = .init(translationX: x, y: 0.0)
        self.innerView.alpha = 0.3
    }

    func expand() {
        self.innerView.transform = .identity
        self.innerView.alpha = 1.0
    }

    func animateImage() {
        let keyframeTranslateY      = CAKeyframeAnimation(keyPath: "transform.translation.y")
        keyframeTranslateY.values   = [0.0, -5.0, 0,0, -2.5, 0.0]
        keyframeTranslateY.keyTimes = [0, 0.25, 0.4, 0.6, 1.0]
        keyframeTranslateY.duration = 0.2

        self.spriteImageView.layer.add(keyframeTranslateY, forKey: "jumping")
    }
}

// MARK: - HoverViewDelegate
extension PokemonListCell: HoverViewDelegate {

    func didTouchDown() {
        self.animateImage()
    }

    func didTouchUpInside() {
        guard let data = self.data else {
            return
        }
        self.delegate?.didTapPokemonListCell(pokemon: data)
    }
}
