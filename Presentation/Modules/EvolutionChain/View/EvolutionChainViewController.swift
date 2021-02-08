//
//  EvolutionChainViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

protocol EvolutionChainView: ShowErrorAlertView {
    func showEvolutionChainModel(_ model: EvolutionChainModel)
}

// MARK: - Properties
final class EvolutionChainViewController: UIViewController {

    var presenter: EvolutionChainPresenter!

    private var evolutionChains = [EvolutionChainModel.EvolutionChain]()

    @IBOutlet private weak var collectionView: UICollectionView! {
        willSet {
            newValue.register(EvolutionChainCell.self)
        }
    }

    @IBOutlet private weak var pageControl: UIPageControl!
}

// MARK: - Life cycle
extension EvolutionChainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

// MARK: - EvolutionChainView
extension EvolutionChainViewController: EvolutionChainView {

    func showEvolutionChainModel(_ model: EvolutionChainModel) {
        self.evolutionChains = model.evolutionChains
        self.pageControl.numberOfPages = self.evolutionChains.count
        self.collectionView.reloadData()
    }
}

extension EvolutionChainViewController {

    @IBAction private func didTapCloseButton() {
        self.presenter.didSelectClose()
    }
}

// MARK: - UICollectionViewDataSource
extension EvolutionChainViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.evolutionChains.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EvolutionChainCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setData(self.evolutionChains[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension EvolutionChainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension EvolutionChainViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = scrollView.currentPage
    }
}
