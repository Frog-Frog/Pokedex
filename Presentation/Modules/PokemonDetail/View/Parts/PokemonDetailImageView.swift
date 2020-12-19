//
//  PokemonDetailImageView.swift
//  Presentation
//
//  Created by masaki hasegawa on 2020/09/28.
//

import UIKit
import SpriteKit

protocol PokemonDetailImageViewDelegate: AnyObject {
    func finishedPokemonImageViewShowAnimation()
}

final class PokemonDetailImageView: XibLoadableView {

    @IBOutlet private weak var imageView: UIImageView! {
        willSet {
            newValue.layer.anchorPoint = .init(x: 0.5, y: 1.0)
            newValue.alpha = 0.0
        }
    }
    @IBOutlet private weak var imageViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet private weak var monsterBallImageView: UIImageView!

    private var skView: SKView?
    private var isLoading: Bool = false
    weak var delegate: PokemonDetailImageViewDelegate?

    func prepareLoading() {
        self.showMonsterBall()
    }

    func setImage(_ imageUrl: URL?) {
        self.isLoading = false

        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false, block: { [weak self] _ in
            guard let self = self else { return }
            self.animate()
        })

        self.imageView.loadImage(with: imageUrl, placeholder: nil, completion: { [weak self] _ in
            guard let self = self else { return }
            self.animate()
        })
    }

    private func animate() {
        // モンスターボールのアニメーション用の遅延と画像のロード、遅い方をトリガーにポケモン登場アニメーションを開始
        if !self.isLoading {
            self.isLoading = true
            return
        }

        self.hideMonsterBall()
        self.createEmitter()

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            guard let self = self else { return }
            self.hideEmitter()
            self.appearImage()
        })
    }

    private func appearImage() {
        let opacityAnimate                   = CABasicAnimation(keyPath: "opacity")
        opacityAnimate.fromValue             = 0.0
        opacityAnimate.toValue               = 1.0
        opacityAnimate.duration              = 0.2
        opacityAnimate.timingFunction        = Easing.EaseOut.quart.function
        opacityAnimate.isRemovedOnCompletion = false
        opacityAnimate.fillMode              = .forwards

        let scaleAnimate                   = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue             = 0.2
        scaleAnimate.toValue               = 1.0
        scaleAnimate.duration              = 0.2
        scaleAnimate.timingFunction        = Easing.EaseOut.quart.function
        scaleAnimate.isRemovedOnCompletion = false
        scaleAnimate.fillMode              = .forwards

        let startYAnimate                   = CABasicAnimation(keyPath: "transform.translation.y")
        startYAnimate.fromValue             = 0.0
        startYAnimate.toValue               = -20.0
        startYAnimate.duration              = 0.15
        startYAnimate.timingFunction        = Easing.EaseInOut.circ.function
        startYAnimate.isRemovedOnCompletion = false
        startYAnimate.fillMode              = .forwards

        let endYAnimate                   = CABasicAnimation(keyPath: "transform.translation.y")
        endYAnimate.fromValue             = -20.0
        endYAnimate.toValue               = 0.0
        endYAnimate.duration              = 0.2
        endYAnimate.beginTime             = CACurrentMediaTime() + 0.15
        endYAnimate.timingFunction        = Easing.EaseInOut.circ.function
        endYAnimate.isRemovedOnCompletion = false
        endYAnimate.fillMode              = .forwards
        endYAnimate.delegate              = self

        self.imageView.layer.add(opacityAnimate, forKey: "opacity")
        self.imageView.layer.add(scaleAnimate, forKey: "scale")
        self.imageView.layer.add(startYAnimate, forKey: "translation.y.start")
        self.imageView.layer.add(endYAnimate, forKey: "translation.y.end")
    }
}

// MARK: - MonsterBall
extension PokemonDetailImageView {

    private func showMonsterBall() {
        let keyframeRotate            = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        keyframeRotate.values         = [0, 20 * CGFloat.pi / 180, 0, -20 * CGFloat.pi / 180, 0]
        keyframeRotate.keyTimes       = [0, 0.25, 0.5, 0.75, 1]
        keyframeRotate.duration       = 1.2
        keyframeRotate.repeatDuration = .infinity

        let position = self.monsterBallImageView.layer.position
        self.monsterBallImageView.layer.anchorPoint = .init(x: 0.5, y: 1.0)
        self.monsterBallImageView.layer.position = .init(x: position.x, y: position.y + self.monsterBallImageView.bounds.height / 2)
        self.monsterBallImageView.layer.add(keyframeRotate, forKey: "transform.rotation.z")

        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.monsterBallImageView.alpha = 1.0
        }, completion: nil)
    }

    private func hideMonsterBall() {
        UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.monsterBallImageView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            self.monsterBallImageView.alpha = 0.0
        }, completion: nil)
    }
}

// MARK: - Emitter
extension PokemonDetailImageView {

    private func createEmitter() {
        let size = self.bounds
        let doubleSize = CGSize(width: size.width * 2, height: size.height * 2)

        // particleが切れないようにview自体は倍サイズで準備しておく
        self.skView = SKView(frame: .init(origin: .init(x: -self.bounds.width / 2, y: -self.bounds.height / 2), size: doubleSize))
        self.skView?.backgroundColor = .clear
        self.addSubview(self.skView!)

        let scene = SKScene(size: self.skView?.bounds.size ?? .zero)
        scene.backgroundColor = .clear
        self.skView?.presentScene(scene)

        if let node = SKEmitterNode(fileNamed: "appearPokemon") {
            node.position = CGPoint(x: scene.frame.width / 2, y: scene.frame.height / 2 - self.bounds.height / 2 + 60)
            scene.addChild(node)
        }
    }

    private func hideEmitter() {
        UIView.animate(withDuration: 0.1, delay: 0.2, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.skView?.subviews.forEach { $0.removeFromSuperview() }
            self.skView?.removeFromSuperview()
            self.skView = nil
        }, completion: nil)
    }
}

extension PokemonDetailImageView: CAAnimationDelegate {

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.delegate?.finishedPokemonImageViewShowAnimation()
    }
}
