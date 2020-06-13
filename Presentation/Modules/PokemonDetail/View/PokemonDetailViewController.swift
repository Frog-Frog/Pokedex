//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

protocol PokemonDetailView: ShowErrorAlertView {
    func showPokemonDetailModel(_ model: PokemonDetailModel)

    func showDegeneration(_ isHidden: Bool)
}

// MARK: - vars
final class PokemonDetailViewController: UIViewController {

    var presenter: PokemonDetailPresenter!

    @IBOutlet private weak var pokemonTypeImageView: UIImageView! {
        willSet {
            newValue.image = newValue.image?.withRenderingMode(.alwaysTemplate)
            newValue.tintColor = .clear
        }
    }

    @IBOutlet private weak var pokemonImageView: UIImageView!

    @IBOutlet private weak var numberLabel: UILabel!

    @IBOutlet private weak var nameLabel: UILabel!

    @IBOutlet private weak var scrollView: UIScrollView!

    @IBOutlet private weak var contentsStackView: UIStackView!

    @IBOutlet private weak var pageControl: UIPageControl!

    @IBOutlet private weak var degenerationButton: UIButton!

}

// MARK: - Life cycle
extension PokemonDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - PokemonDetailView
extension PokemonDetailViewController: PokemonDetailView {

    func showPokemonDetailModel(_ model: PokemonDetailModel) {
        self.pokemonTypeImageView.tintColor = UIColor(hex: model.typeHex)
        self.pokemonImageView.loadImage(with: model.imageUrl, placeholder: Asset.mosnterball.image)
        self.numberLabel.text = "No.\(model.number)"
        self.nameLabel.text = model.name

        let informationView = PokemonDetailInformationView(model.information)
        self.contentsStackView.addArrangedSubview(informationView)

        let statsView = PokemonDetailStatsView(model.stats)
        self.contentsStackView.addArrangedSubview(statsView)

        self.pageControl.numberOfPages = self.contentsStackView.arrangedSubviews.count
    }

    func showDegeneration(_ isHidden: Bool) {
        self.degenerationButton.isHidden = isHidden
    }
}

// MARK: - IBAction
extension PokemonDetailViewController {

    @IBAction private func didTapPopButton() {
        self.presenter.didSelectPop()
    }

    @IBAction private func didTapDegenerationButton() {
        self.presenter.didSelectDegeneration()
    }
}

// MARK: - UIScrollViewDelegate
extension PokemonDetailViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = scrollView.currentPage
    }
}
