//
//  UIImageView+.swift
//  QuizTodayExtension
//
//  Created by Tomosuke Okada on 2020/05/23.
//

import Nuke
import UIKit

extension UIImageView {

    typealias Completion = (Result<Void, Error>) -> Void

    func loadShadowImage(with url: URL?, shadowColor: UIColor, completion: Completion? = nil) {
        guard let url = url else {
            return
        }
        ImagePipeline.shared.loadImage(with: url, completion: {
            switch $0 {
            case .success(let response):
                let image = response.image.withRenderingMode(.alwaysTemplate)
                self.image = image
                self.tintColor = shadowColor
                completion?(.success(()))
            case .failure(let error):
                completion?(.failure(error))
            }
        })
    }
}
