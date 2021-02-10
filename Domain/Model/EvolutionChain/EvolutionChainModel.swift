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

    public let chainType: ChainType

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
        self.chainType = ChainType(self.evolutionChains)
    }
}

extension EvolutionChainModel {

    public struct EvolutionChain {

        public let pokemons: [Pokemon]

        init(_ species: [NamedURLResource]) {
            self.pokemons = species.map { Pokemon($0) }
        }
    }
}

extension EvolutionChainModel {

    public enum ChainType {
        case single
        case dual

        init(_ evolutionChains: [EvolutionChain]) {
            let max = evolutionChains.map { $0.pokemons.count }.max()!
            switch max {
            case 2:
                self = .single
            case 3:
                self = .dual
            default:
                self = .single
            }
        }
    }
}
