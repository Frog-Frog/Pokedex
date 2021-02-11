//
//  UrlScheme.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/05/10.
//

import Foundation

public struct UrlScheme {

    public let action: ActionType?

    public init?(_ string: String) {
        guard let url = URL(string: string) else {
            //
            return nil
        }
        self.init(url)
    }

    public init?(_ url: URL) {
        guard url.scheme == "pokedex" else {
            // pokedexのURLスキームじゃない場合はnil
            return nil
        }
        self.action = ActionType(url)
    }
}

extension UrlScheme {

    public enum ActionType {
        case open(TransitionType?)

        init?(_ url: URL) {
            switch url.host {
            case "open":
                self = .open(TransitionType(URLComponents(string: url.absoluteString)))
            default:
                return nil
            }
        }
    }
}

extension UrlScheme.ActionType {

    public enum TransitionType {
        case pokemonDetail(number: Int)
        case itemDetail(number: Int)

        init?(_ components: URLComponents?) {
            switch components?.path {
            case "/pokemon_detail":
                guard let value = components?.searchQueryItem(by: "number"), let number = Int(value) else {
                    return nil
                }
                self = .pokemonDetail(number: number)
            case "/item_detail":
                guard let value = components?.searchQueryItem(by: "number"), let number = Int(value) else {
                    return nil
                }
                self = .itemDetail(number: number)
            default:
                // その他の場合はnil(アプリを開くだけ)
                return nil
            }
        }
    }
}

private extension URLComponents {

    func searchQueryItem(by key: String) -> String? {
        return self.queryItems?.first { $0.name == key }?.value
    }
}
