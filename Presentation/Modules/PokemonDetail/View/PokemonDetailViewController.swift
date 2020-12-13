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

    @IBOutlet private weak var pokemonTypeBackgroundView: PokemonDetailTypeBackgroundView! {
        willSet {
            newValue.delegate = self
        }
    }

    @IBOutlet private weak var pokemonTypeImageView: UIImageView! {
        willSet {
            newValue.image = newValue.image?.withRenderingMode(.alwaysTemplate)
            newValue.tintColor = .clear
        }
    }

    @IBOutlet private weak var pokemonImageView: PokemonDetailImageView! {
        willSet {
            newValue.delegate = self
        }
    }

    @IBOutlet private var pokemonImageViewCenterYConstraint: NSLayoutConstraint!

    @IBOutlet private var pokemonImageViewBottomConstraint: NSLayoutConstraint!

    @IBOutlet private var pokemonImageViewTopConstraint: NSLayoutConstraint!

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
        self.setupUI()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showPokemonImageView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - UI
extension PokemonDetailViewController {

    private func setupUI() {
        self.pokemonImageView.prepareLoading()
        self.pokemonImageView.alpha     = 0.0
        self.pokemonTypeImageView.alpha = 0.0
        self.nameLabel.alpha            = 0.0
        self.numberLabel.alpha          = 0.0
        self.contentsStackView.alpha    = 0.0
        self.pageControl.alpha          = 0.0
    }

    private func showPokemonImageView() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let self = self else { return }
            self.pokemonImageView.alpha = 1.0
        })
    }

    private func showUI() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.nameLabel.alpha         = 1.0
            self.numberLabel.alpha       = 1.0
            self.contentsStackView.alpha = 1.0
            self.pageControl.alpha       = 1.0
        }, completion: nil)

        self.contentsStackView.subviews.forEach { subview in
            (subview as? PokemonDetailInformationView)?.animate()
        }
    }
}

// MARK: - PokemonDetailView
extension PokemonDetailViewController: PokemonDetailView {

    func showPokemonDetailModel(_ model: PokemonDetailModel) {
        let color: UIColor = .init(hex: model.typeHex)
        self.pokemonTypeBackgroundView.setColor(color)
        self.pokemonTypeBackgroundView.show()
        self.pokemonTypeImageView.tintColor = color
        self.pokemonImageView.setImage(model.imageUrl)
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
        if let statsView = self.contentsStackView.subviews[safe: scrollView.currentPage] as? PokemonDetailStatsView {
            statsView.animate()
        }
    }
}

// MARK: - PokemonDetailImageViewDelegate
extension PokemonDetailViewController: PokemonDetailImageViewDelegate {

    func finishedPokemonImageViewShowAnimation() {
        self.pokemonImageViewTopConstraint.isActive = true
        self.pokemonImageViewBottomConstraint.isActive = true
        self.pokemonImageViewCenterYConstraint.isActive = false
        UIView.animate(withDuration: 0.2, delay: 0.05, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            guard let self = self else { return }
            self.pokemonTypeBackgroundView.hide()
        })
    }
}

extension PokemonDetailViewController: PokemonDetailTypeBackgroundViewDelegate {

    func finishedTypeBackgroundViewShowAnimation() {
        self.pokemonTypeImageView.alpha = 1.0
    }

    func finishedTypeBackgroundViewHideAnimation() {
        self.showUI()
    }
}
