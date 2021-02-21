//
//  EvolutionChainResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import DataStore

extension EvolutionChainResponse {

    static var bulbasaurStub: Self {
        return JsonParser.parseJson("EvolutionChain_Bulbasaur")
    }

    static var eeveeStub: Self {
        return JsonParser.parseJson("EvolutionChain_Eevee")
    }

    static var kangaskhanStub: Self {
        return JsonParser.parseJson("EvolutionChain_Kangaskhan")
    }
}
