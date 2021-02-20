//
//  NamedURLResource.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

@testable import DataStore

extension NamedURLResource {

    static var pokemonStub: Self {
        return .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    }

    static var itemStub: Self {
        return .init(name: "master-ball", url: "https://pokeapi.co/api/v2/item/1/")
    }

    static var itemCategoryStub: Self {
        return .init(name: "standard-balls", url: "https://pokeapi.co/api/v2/item-category/34/")
    }

    static var languageEnglishStub: Self {
        return .init(name: "en", url: "https://pokeapi.co/api/v2/language/9/")
    }
    
    static var languageJapaneseStub: Self {
        return .init(name: "ja", url: "https://pokeapi.co/api/v2/language/11/")
    }

    static var versionGroupStub: Self {
        return .init(name: "ruby-sapphire", url: "https://pokeapi.co/api/v2/version-group/5/")
    }

    static var generationStub: Self {
        return .init(name: "generation-iii", url: "https://pokeapi.co/api/v2/generation/3/")
    }
}

extension Array where Element == NamedURLResource {

    static var pokemonStub: Self {
        return [
            .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
            .init(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
            .init(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/")
        ]
    }

    static var itemStub: Self {
        return [
            .init(name: "master-ball", url: "https://pokeapi.co/api/v2/item/1/"),
            .init(name: "ultra-ball", url: "https://pokeapi.co/api/v2/item/2/"),
            .init(name: "great-ball", url: "https://pokeapi.co/api/v2/item/3/")
        ]
    }

    static var itemAttributeStub: Self {
        return [
            .init(name: "countable", url: "https://pokeapi.co/api/v2/item-attribute/1/"),
            .init(name: "consumable", url: "https://pokeapi.co/api/v2/item-attribute/2/"),
            .init(name: "usable-in-battle", url: "https://pokeapi.co/api/v2/item-attribute/4/"),
            .init(name: "holdable", url: "https://pokeapi.co/api/v2/item-attribute/5/")
        ]
    }
}
