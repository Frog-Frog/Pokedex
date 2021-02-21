//
//  ItemListViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import Nuke
import UIKit

/// @mockable
protocol ItemListView: ShowErrorAlertView {
    func showItemListModel(_ model: ItemListModel)
}

// MARK: - vars
final class ItemListViewController: UIViewController {

    var presenter: ItemListPresenter!

    var Items = [Item]()

    @IBOutlet private weak var tableView: BaseTableView! {
        willSet {
            newValue.register(ItemListCell.self)
        }
    }

    @IBOutlet private weak var slider: VerticalSlider! {
        willSet {
            newValue.setThumbImage(Asset.sliderThumb.image, for: .normal)
        }
    }

    @IBOutlet private var gradationViews: [GradationView]! {
        willSet {
            newValue.forEach { $0.setGradation() }
        }
    }
}

// MARK: - Life cycle
extension ItemListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

// MARK: - ItemListView
extension ItemListViewController: ItemListView {

    func showItemListModel(_ model: ItemListModel) {
        self.Items = model.items

        self.tableView.contentInset.top = self.tableView.bounds.height/2
        self.tableView.contentInset.bottom = self.tableView.bounds.height/2

        self.tableView.reloadData {
            self.slider.minimumValue = -Float(self.tableView.contentInset.top)
            self.slider.maximumValue = Float(self.tableView.contentSize.height - self.tableView.bounds.height + self.tableView.contentInset.bottom)
            self.slider.setValue(self.slider.minimumValue, animated: false)
        }
    }
}

// MARK: - IBAction
extension ItemListViewController {

    @IBAction private func didChangeValue(_ sender: UISlider) {
        self.tableView.setContentOffset(.init(x: 0, y: CGFloat(sender.value)), animated: false)
    }
}

// MARK: - UIScrollViewDelegate
extension ItemListViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.slider.value = Float(scrollView.contentOffset.y)
    }
}

// MARK: - UITableViewDataSource
extension ItemListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setItem(self.Items[indexPath.row], delegate: self)
        return cell
    }
}

// MARK: - UITableViewDataSourcePrefetching
extension ItemListViewController: UITableViewDataSourcePrefetching {

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { self.Items[$0.row].imageUrl }
        ImagePreheater().startPreheating(with: urls)
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { self.Items[$0.row].imageUrl }
        ImagePreheater().stopPreheating(with: urls)
    }
}

// MARK: - UITableViewDelegate
extension ItemListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ItemListCell else { return }
        cell.abbreviate()
        UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            cell.expand()
        }, completion: nil)
    }
}

// MARK: - ItemListCellDelegate
extension ItemListViewController: ItemListCellDelegate {

    func didTapItemListCell(item Item: Item) {
        self.presenter.didSelect(Item)
    }
}
