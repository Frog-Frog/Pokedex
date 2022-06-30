//
//  TodayViewController.swift
//  QuizTodayExtension
//
//  Created by Tomosuke Okada on 2020/05/22.
//

//import Domain
import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

    @IBOutlet private weak var shadowImageView: UIImageView!

    private var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        self.number = RandomPokemonNumberGenrator.generate()
        let url = URL(string: "")! //PokemonImageURLGenerator.generateThumbnailURL(from: self.number)
        self.shadowImageView.loadShadowImage(with: url, shadowColor: .black) { result in
            switch result {
            case .success:
                completionHandler(NCUpdateResult.newData)
            case .failure:
                completionHandler(NCUpdateResult.failed)
            }
        }
    }
}

// MARK: - IBAction
extension TodayViewController {

    @IBAction private func didTapWidget() {
        let url = URL(string: "pokedex://open/pokemon_detail?number=\(self.number)")
        extensionContext?.open(url!, completionHandler: nil)
    }
}
