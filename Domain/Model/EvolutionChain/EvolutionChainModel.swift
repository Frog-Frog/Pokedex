//
//  EvolutionChainModel.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import DataStore
import Foundation

public struct EvolutionChainModel {

    public let evolutionChains: [EvolutionChain]

    init(_ response: EvolutionChainResponse) {
        var species = [[NamedURLResource]]()
        let firstChain = response.chain
        firstChain.evolvesTo.forEach { secondChain in
            if secondChain.evolvesTo.isEmpty {
                species.append([firstChain.species, secondChain.species])
            } else {
                secondChain.evolvesTo.forEach { thirdChain in
                    species.append([firstChain.species, secondChain.species, thirdChain.species])
                }
            }
        }
        self.evolutionChains = species.map { EvolutionChain($0) }
    }
}

extension EvolutionChainModel {

    public struct EvolutionChain {

        public let pokemons: [Pokemon]

        init(_ species: [NamedURLResource]) {
            let lastIndex = species.count - 1
            self.pokemons = species.enumerated().map { Pokemon($0.element, hasEvolution: lastIndex > $0.offset) }
        }
    }
}

extension EvolutionChainModel.EvolutionChain {

    public struct Pokemon {

        public let name: String

        public let number: Int

        public let imageUrl: URL?

        public let hasEvolution: Bool

        init(_ resource: NamedURLResource, hasEvolution: Bool) {
            self.name = resource.name.capitalizingFirstLetter()
            self.number = PokemonNumberGenerator.generate(from: resource.url)
            self.imageUrl = PokemonImageURLGenerator.generateThumbnailURL(from: self.number)
            self.hasEvolution = hasEvolution
        }
    }
}
