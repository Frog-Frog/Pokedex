//
//  UIImageView+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import Nuke
import UIKit

extension UIImageView {

    typealias Completion = (Result<UIImage, Error>) -> Void

    func loadImage(with urlString: String, placeholder: UIImage? = nil, completion: Completion? = nil) {
        Nuke.loadImage(with: URL(string: urlString)!, options: ImageLoadingOptions(placeholder: placeholder), into: self) { result in
            switch result {
            case .success(let response):
                completion?(.success(response.image))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
