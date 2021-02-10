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

    @IBOutlet private weak var actionSheetView: UIView! {
        willSet {
            newValue.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }

    @IBOutlet private weak var actionSheetHeightConstraint: NSLayoutConstraint!

    @IBOutlet private var actionSheetTopConstraint: NSLayoutConstraint!

    @IBOutlet private weak var collectionView: UICollectionView! {
        willSet {
            newValue.register(EvolutionChainPageCell.self)
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
        self.actionSheetHeightConstraint.constant = model.chainType.actionSheetHeight
        self.collectionView.reloadData {
            self.setCellActive()
        }
    }

    private func setCellActive() {
        let cells = self.collectionView.visibleCells.compactMap { $0 as? EvolutionChainPageCell }
        cells.forEach {
            let centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.width / 2
            let isActive = $0.frame.contains(CGPoint(x: centerX, y: self.collectionView.center.y))
            $0.setIsActive(isActive)
        }
    }
}

// MARK: - IBAction
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
        let cell: EvolutionChainPageCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setEvolutionChain(self.evolutionChains[indexPath.item], delegate: self)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension EvolutionChainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

// MARK: - UIScrollViewDelegate
extension EvolutionChainViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = scrollView.currentPage
        self.setCellActive()
    }
}

// MARK: - EvolutionChainPageCellDelegate
extension EvolutionChainViewController: EvolutionChainPageCellDelegate {

    func cell(_ cell: EvolutionChainPageCell, didTap pokemon: Pokemon) {

    }
}

private extension EvolutionChainModel.ChainType {

    var actionSheetHeight: CGFloat {
        switch self {
        case .single:
            return 200
        case .dual:
            return 270
        }
    }
}
