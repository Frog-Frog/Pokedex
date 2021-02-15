//
//  PokemonView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/10.
//

import Domain
import UIKit

protocol PokemonViewDelegate: AnyObject {

    func didTapPokemonView(_ pokemon: Pokemon)
}

final class PokemonView: XibLoadableView {

    @IBOutlet private weak var spriteImageView: UIImageView!

    @IBOutlet private weak var innerView: HoverView! {
        willSet {
            newValue.delegate = self
        }
    }

    @IBOutlet private weak var numberLabel: UILabel!

    @IBOutlet private weak var nameLabel: UILabel!

    private var pokemon: Pokemon?

    private weak var delegate: PokemonViewDelegate?

    func setPokemon(_ pokemon: Pokemon, delegate: PokemonViewDelegate?) {
        self.pokemon = pokemon
        self.delegate = delegate
        self.spriteImageView.loadImage(with: pokemon.imageUrl, placeholder: Asset.monsterball.image)
        self.numberLabel.text = L10n.Common.number(pokemon.number)
        self.nameLabel.text = pokemon.name
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

    private func animateImage() {
        let keyframeTranslateY      = CAKeyframeAnimation(keyPath: "transform.translation.y")
        keyframeTranslateY.values   = [0.0, -5.0, 0,0, -2.5, 0.0]
        keyframeTranslateY.keyTimes = [0, 0.25, 0.4, 0.6, 1.0]
        keyframeTranslateY.duration = 0.2

        self.spriteImageView.layer.add(keyframeTranslateY, forKey: "jumping")
    }
}

extension PokemonView: HoverViewDelegate {

    func didTouchDown() {
        self.animateImage()
    }

    func didTouchUpInside() {
        guard let pokemon = self.pokemon else {
            return
        }
        self.delegate?.didTapPokemonView(pokemon)
    }
}
