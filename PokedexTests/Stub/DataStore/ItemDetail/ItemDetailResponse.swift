//
//  ItemDetailResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

@testable import DataStore

extension ItemDetailResponse {

    static var stub: Self {
        return .init(id: 1,
                     name: "master-ball",
                     sprites: .stub,
                     attributes: .itemAttributeStub,
                     category: .itemCategoryStub,
                     cost: 0,
                     heldByPokemon: [],
                     effectEntries: [.stub],
                     flavorTextEntries: .stub,
                     gameIndices: [.stub],
                     machines: [],
                     names: [.stub],
                     babyTriggerFor: nil,
                     flingEffect: nil,
                     flingPower: nil)
    }
}

extension ItemDetailResponse.Sprite {

    static var stub: Self {
        return .init(default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/master-ball.png")
    }
}

extension ItemDetailResponse.EffectEntry {

    static var stub: Self {
        return .init(language: .languageEnglishStub,
                     shortEffect: "Catches a wild Pokémon every time.",
                     effect: "Used in battle : Catches a wild Pokémon without fail. If used in a trainer battle, nothing happens and the ball is lost.")
    }
}

extension Array where Element == ItemDetailResponse.FlavorTextEntry {
    
    static var stub: Self {
        return [
            .init(language: .languageEnglishStub,
                  text: "The best BALL that catches a POKéMON without fail.",
                  versionGroup: .versionGroupStub),
            .init(language: .languageJapaneseStub,
                  text: "野生の　ポケモンを　必ず 捕まえることが　できる 最高　性能の　ボール。",
                  versionGroup: .versionGroupStub)
        ]
    }
}

extension ItemDetailResponse.GameIndice {

    static var stub: Self {
        return .init(gameIndex: 1,
                     generation: .generationStub)
    }
}

extension ItemDetailResponse.Name {

    static var stub: Self {
        return .init(name: "Master Ball",
                     language: NamedURLResource.languageEnglishStub)
    }
}
