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

protocol ItemListView: ShowErrorAlertView {
    func showItemListModel(_ model: ItemListModel)
}

// MARK: - vars
final class ItemListViewController: UIViewController {

    var presenter: ItemListPresenter!

    var items = [ItemListModel.Item]()

    @IBOutlet private weak var tableView: BaseTableView! {
        willSet {
            newValue.register(ItemListCell.self)
            newValue.contentInset.top = 24
            newValue.contentInset.bottom = 16
        }
    }
}

// MARK: - Life cycle
extension ItemListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBar()
    }
}

// MARK: - Setup
extension ItemListViewController {

    private func setupNavigationBar() {
        self.navigationItem.titleView =  {
            let imageView = UIImageView(image: Asset.logo.image)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    }
}

// MARK: - ItemListView
extension ItemListViewController: ItemListView {

    func showItemListModel(_ model: ItemListModel) {
        self.items = model.items
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ItemListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setData(self.items[indexPath.row], delegate: self)
        return cell
    }
}

// MARK: - UITableViewDataSourcePrefetching
extension ItemListViewController: UITableViewDataSourcePrefetching {

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { self.items[$0.row].imageUrl }
        ImagePreheater().startPreheating(with: urls)
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { self.items[$0.row].imageUrl }
        ImagePreheater().stopPreheating(with: urls)
    }
}

// MARK: - UITableViewDelegate
extension ItemListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ItemListCell else { return }
        cell.abbreviate()
        UIView.animate(withDuration: 0.4, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            cell.expand()
        }, completion: nil)
    }
}

// MARK: - ItemListCellDelegate
extension ItemListViewController: ItemListCellDelegate {

    func didTapItemListCell(item: ItemListModel.Item) {
        self.presenter.didSelect(item)
    }
}
