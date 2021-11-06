///
/// @Generated by Mockolo
///



import Alamofire
import CoreMotion
import CoreSpotlight
import Foundation
import MobileCoreServices
import Nuke
import SpriteKit
import UIKit
@testable import DataStore
@testable import Domain
@testable import Presentation


class ItemListWireframeMock: ItemListWireframe {
    init() { }
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }


    private(set) var viewControllerSetCallCount = 0
    var viewController: UIViewController? = nil { didSet { viewControllerSetCallCount += 1 } }

    private(set) var pushItemDetailCallCount = 0
    var pushItemDetailHandler: ((Int) -> ())?
    func pushItemDetail(number: Int)  {
        pushItemDetailCallCount += 1
        if let pushItemDetailHandler = pushItemDetailHandler {
            pushItemDetailHandler(number)
        }
        
    }
}

class ItemDetailWireframeMock: ItemDetailWireframe {
    init() { }
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }


    private(set) var viewControllerSetCallCount = 0
    var viewController: UIViewController? = nil { didSet { viewControllerSetCallCount += 1 } }

    private(set) var popCallCount = 0
    var popHandler: (() -> ())?
    func pop()  {
        popCallCount += 1
        if let popHandler = popHandler {
            popHandler()
        }
        
    }

    private(set) var popToRootCallCount = 0
    var popToRootHandler: (() -> ())?
    func popToRoot()  {
        popToRootCallCount += 1
        if let popToRootHandler = popToRootHandler {
            popToRootHandler()
        }
        
    }
}

class PokemonListWireframeMock: PokemonListWireframe {
    init() { }
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }


    private(set) var viewControllerSetCallCount = 0
    var viewController: UIViewController? = nil { didSet { viewControllerSetCallCount += 1 } }

    private(set) var pushPokemonDetailCallCount = 0
    var pushPokemonDetailHandler: ((Int) -> ())?
    func pushPokemonDetail(number: Int)  {
        pushPokemonDetailCallCount += 1
        if let pushPokemonDetailHandler = pushPokemonDetailHandler {
            pushPokemonDetailHandler(number)
        }
        
    }
}

class PokemonDetailWireframeMock: PokemonDetailWireframe {
    init() { }
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }


    private(set) var viewControllerSetCallCount = 0
    var viewController: UIViewController? = nil { didSet { viewControllerSetCallCount += 1 } }

    private(set) var popCallCount = 0
    var popHandler: (() -> ())?
    func pop()  {
        popCallCount += 1
        if let popHandler = popHandler {
            popHandler()
        }
        
    }

    private(set) var popToRootCallCount = 0
    var popToRootHandler: (() -> ())?
    func popToRoot()  {
        popToRootCallCount += 1
        if let popToRootHandler = popToRootHandler {
            popToRootHandler()
        }
        
    }

    private(set) var pushPokemonDetailCallCount = 0
    var pushPokemonDetailHandler: ((Int) -> ())?
    func pushPokemonDetail(number: Int)  {
        pushPokemonDetailCallCount += 1
        if let pushPokemonDetailHandler = pushPokemonDetailHandler {
            pushPokemonDetailHandler(number)
        }
        
    }

    private(set) var presentEvolutionChainCallCount = 0
    var presentEvolutionChainHandler: ((EvolutionChainModel, EvolutionChainWireframeDelegate) -> ())?
    func presentEvolutionChain(evolutionChainModel: EvolutionChainModel, delegate: EvolutionChainWireframeDelegate)  {
        presentEvolutionChainCallCount += 1
        if let presentEvolutionChainHandler = presentEvolutionChainHandler {
            presentEvolutionChainHandler(evolutionChainModel, delegate)
        }
        
    }
}

class EvolutionChainWireframeMock: EvolutionChainWireframe {
    init() { }
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }


    private(set) var viewControllerSetCallCount = 0
    var viewController: UIViewController? = nil { didSet { viewControllerSetCallCount += 1 } }

    private(set) var dismissCallCount = 0
    var dismissHandler: (() -> ())?
    func dismiss()  {
        dismissCallCount += 1
        if let dismissHandler = dismissHandler {
            dismissHandler()
        }
        
    }

    private(set) var dismissAnimatedCallCount = 0
    var dismissAnimatedHandler: ((Bool) -> ())?
    func dismiss(animated: Bool)  {
        dismissAnimatedCallCount += 1
        if let dismissAnimatedHandler = dismissAnimatedHandler {
            dismissAnimatedHandler(animated)
        }
        
    }

    private(set) var dismissWithPushPokemonDetailCallCount = 0
    var dismissWithPushPokemonDetailHandler: ((Int) -> ())?
    func dismissWithPushPokemonDetail(number: Int)  {
        dismissWithPushPokemonDetailCallCount += 1
        if let dismissWithPushPokemonDetailHandler = dismissWithPushPokemonDetailHandler {
            dismissWithPushPokemonDetailHandler(number)
        }
        
    }

    private(set) var dismissCompletionCallCount = 0
    var dismissCompletionHandler: (((() -> Void)?) -> ())?
    func dismiss(completion: (() -> Void)?)  {
        dismissCompletionCallCount += 1
        if let dismissCompletionHandler = dismissCompletionHandler {
            dismissCompletionHandler(completion)
        }
        
    }

    private(set) var dismissAnimatedCompletionCallCount = 0
    var dismissAnimatedCompletionHandler: ((Bool, (() -> Void)?) -> ())?
    func dismiss(animated: Bool, completion: (() -> Void)?)  {
        dismissAnimatedCompletionCallCount += 1
        if let dismissAnimatedCompletionHandler = dismissAnimatedCompletionHandler {
            dismissAnimatedCompletionHandler(animated, completion)
        }
        
    }
}

class ItemDetailViewMock: ItemDetailView {
    init() { }


    private(set) var showAlertCallCount = 0
    var showAlertHandler: ((String, String, [UIAlertAction]) -> ())?
    func showAlert(_ title: String, message: String, actions: [UIAlertAction])  {
        showAlertCallCount += 1
        if let showAlertHandler = showAlertHandler {
            showAlertHandler(title, message, actions)
        }
        
    }

    private(set) var showErrorAlertCallCount = 0
    var showErrorAlertHandler: ((Error) -> ())?
    func showErrorAlert(_ error: Error)  {
        showErrorAlertCallCount += 1
        if let showErrorAlertHandler = showErrorAlertHandler {
            showErrorAlertHandler(error)
        }
        
    }

    private(set) var showItemDetailModelCallCount = 0
    var showItemDetailModelHandler: ((ItemDetailModel) -> ())?
    func showItemDetailModel(_ model: ItemDetailModel)  {
        showItemDetailModelCallCount += 1
        if let showItemDetailModelHandler = showItemDetailModelHandler {
            showItemDetailModelHandler(model)
        }
        
    }
}

class EvolutionChainViewMock: EvolutionChainView {
    init() { }


    private(set) var showAlertCallCount = 0
    var showAlertHandler: ((String, String, [UIAlertAction]) -> ())?
    func showAlert(_ title: String, message: String, actions: [UIAlertAction])  {
        showAlertCallCount += 1
        if let showAlertHandler = showAlertHandler {
            showAlertHandler(title, message, actions)
        }
        
    }

    private(set) var showErrorAlertCallCount = 0
    var showErrorAlertHandler: ((Error) -> ())?
    func showErrorAlert(_ error: Error)  {
        showErrorAlertCallCount += 1
        if let showErrorAlertHandler = showErrorAlertHandler {
            showErrorAlertHandler(error)
        }
        
    }

    private(set) var showEvolutionChainModelCallCount = 0
    var showEvolutionChainModelHandler: ((EvolutionChainModel) -> ())?
    func showEvolutionChainModel(_ model: EvolutionChainModel)  {
        showEvolutionChainModelCallCount += 1
        if let showEvolutionChainModelHandler = showEvolutionChainModelHandler {
            showEvolutionChainModelHandler(model)
        }
        
    }
}

class ItemListViewMock: ItemListView {
    init() { }


    private(set) var showAlertCallCount = 0
    var showAlertHandler: ((String, String, [UIAlertAction]) -> ())?
    func showAlert(_ title: String, message: String, actions: [UIAlertAction])  {
        showAlertCallCount += 1
        if let showAlertHandler = showAlertHandler {
            showAlertHandler(title, message, actions)
        }
        
    }

    private(set) var showErrorAlertCallCount = 0
    var showErrorAlertHandler: ((Error) -> ())?
    func showErrorAlert(_ error: Error)  {
        showErrorAlertCallCount += 1
        if let showErrorAlertHandler = showErrorAlertHandler {
            showErrorAlertHandler(error)
        }
        
    }

    private(set) var showItemListModelCallCount = 0
    var showItemListModelHandler: ((ItemListModel) -> ())?
    func showItemListModel(_ model: ItemListModel)  {
        showItemListModelCallCount += 1
        if let showItemListModelHandler = showItemListModelHandler {
            showItemListModelHandler(model)
        }
        
    }
}

class PokemonListViewMock: PokemonListView {
    init() { }


    private(set) var showAlertCallCount = 0
    var showAlertHandler: ((String, String, [UIAlertAction]) -> ())?
    func showAlert(_ title: String, message: String, actions: [UIAlertAction])  {
        showAlertCallCount += 1
        if let showAlertHandler = showAlertHandler {
            showAlertHandler(title, message, actions)
        }
        
    }

    private(set) var showErrorAlertCallCount = 0
    var showErrorAlertHandler: ((Error) -> ())?
    func showErrorAlert(_ error: Error)  {
        showErrorAlertCallCount += 1
        if let showErrorAlertHandler = showErrorAlertHandler {
            showErrorAlertHandler(error)
        }
        
    }

    private(set) var showPokemonListModelCallCount = 0
    var showPokemonListModelHandler: ((PokemonListModel) -> ())?
    func showPokemonListModel(_ model: PokemonListModel)  {
        showPokemonListModelCallCount += 1
        if let showPokemonListModelHandler = showPokemonListModelHandler {
            showPokemonListModelHandler(model)
        }
        
    }
}

class PokemonDetailViewMock: PokemonDetailView {
    init() { }


    private(set) var showAlertCallCount = 0
    var showAlertHandler: ((String, String, [UIAlertAction]) -> ())?
    func showAlert(_ title: String, message: String, actions: [UIAlertAction])  {
        showAlertCallCount += 1
        if let showAlertHandler = showAlertHandler {
            showAlertHandler(title, message, actions)
        }
        
    }

    private(set) var showErrorAlertCallCount = 0
    var showErrorAlertHandler: ((Error) -> ())?
    func showErrorAlert(_ error: Error)  {
        showErrorAlertCallCount += 1
        if let showErrorAlertHandler = showErrorAlertHandler {
            showErrorAlertHandler(error)
        }
        
    }

    private(set) var showPokemonDetailModelCallCount = 0
    var showPokemonDetailModelHandler: ((PokemonDetailModel) -> ())?
    func showPokemonDetailModel(_ model: PokemonDetailModel)  {
        showPokemonDetailModelCallCount += 1
        if let showPokemonDetailModelHandler = showPokemonDetailModelHandler {
            showPokemonDetailModelHandler(model)
        }
        
    }

    private(set) var showEvolutionChainCallCount = 0
    var showEvolutionChainHandler: ((Bool) -> ())?
    func showEvolutionChain(_ isHidden: Bool)  {
        showEvolutionChainCallCount += 1
        if let showEvolutionChainHandler = showEvolutionChainHandler {
            showEvolutionChainHandler(isHidden)
        }
        
    }
}

class ItemListTranslatorMock: ItemListTranslator {
    init() { }


    private(set) var convertCallCount = 0
    var convertHandler: ((ItemListResponse) -> (ItemListModel))?
    func convert(from response: ItemListResponse) -> ItemListModel {
        convertCallCount += 1
        if let convertHandler = convertHandler {
            return convertHandler(response)
        }
        fatalError("convertHandler returns can't have a default value thus its handler must be set")
    }
}

class APIDataStoreMock: APIDataStore {
    init() { }


    private(set) var requestCallCount = 0
    var requestHandler: ((APIRequestable) throws -> (Data))?
    func request(_ request: APIRequestable) throws -> Data {
        requestCallCount += 1
        if let requestHandler = requestHandler {
            return try requestHandler(request)
        }
        fatalError("requestHandler returns can't have a default value thus its handler must be set")
    }
}

class ItemDetailTranslatorMock: ItemDetailTranslator {
    init() { }


    private(set) var convertCallCount = 0
    var convertHandler: ((ItemDetailResponse) -> (ItemDetailModel))?
    func convert(from response: ItemDetailResponse) -> ItemDetailModel {
        convertCallCount += 1
        if let convertHandler = convertHandler {
            return convertHandler(response)
        }
        fatalError("convertHandler returns can't have a default value thus its handler must be set")
    }
}

class ImageDataStoreMock: ImageDataStore {
    init() { }


    private(set) var loadCallCount = 0
    var loadHandler: ((URL) throws -> (Data))?
    func load(from url: URL) throws -> Data {
        loadCallCount += 1
        if let loadHandler = loadHandler {
            return try loadHandler(url)
        }
        fatalError("loadHandler returns can't have a default value thus its handler must be set")
    }
}

class PokemonListTranslatorMock: PokemonListTranslator {
    init() { }


    private(set) var convertCallCount = 0
    var convertHandler: ((PokemonListResponse) -> (PokemonListModel))?
    func convert(from response: PokemonListResponse) -> PokemonListModel {
        convertCallCount += 1
        if let convertHandler = convertHandler {
            return convertHandler(response)
        }
        fatalError("convertHandler returns can't have a default value thus its handler must be set")
    }
}

class PokeAPIDataStoreMock: PokeAPIDataStore {
    init() { }


    private(set) var requestCallCount = 0
    var requestHandler: ((PokeAPIRequestable) throws -> (Any))?
    func request<T: Decodable>(_ request: PokeAPIRequestable) throws -> T {
        requestCallCount += 1
        if let requestHandler = requestHandler {
            return try requestHandler(request) as! T
        }
        fatalError("requestHandler returns can't have a default value thus its handler must be set")
    }
}

class PokemonDetailTranslatorMock: PokemonDetailTranslator {
    init() { }


    private(set) var convertCallCount = 0
    var convertHandler: ((PokemonDetailResponse) -> (PokemonDetailModel))?
    func convert(from response: PokemonDetailResponse) -> PokemonDetailModel {
        convertCallCount += 1
        if let convertHandler = convertHandler {
            return convertHandler(response)
        }
        fatalError("convertHandler returns can't have a default value thus its handler must be set")
    }
}

class PokemonSpeciesTranslatorMock: PokemonSpeciesTranslator {
    init() { }


    private(set) var convertCallCount = 0
    var convertHandler: ((PokemonSpeciesResponse) -> (PokemonSpeciesModel))?
    func convert(from response: PokemonSpeciesResponse) -> PokemonSpeciesModel {
        convertCallCount += 1
        if let convertHandler = convertHandler {
            return convertHandler(response)
        }
        fatalError("convertHandler returns can't have a default value thus its handler must be set")
    }
}

class EvolutionChainTranslatorMock: EvolutionChainTranslator {
    init() { }


    private(set) var convertCallCount = 0
    var convertHandler: ((EvolutionChainResponse) -> (EvolutionChainModel))?
    func convert(from response: EvolutionChainResponse) -> EvolutionChainModel {
        convertCallCount += 1
        if let convertHandler = convertHandler {
            return convertHandler(response)
        }
        fatalError("convertHandler returns can't have a default value thus its handler must be set")
    }
}

class SpotlightDataStoreMock: SpotlightDataStore {
    init() { }


    private(set) var saveCallCount = 0
    var saveHandler: ((SpotlightRequestable) -> ())?
    func save(_ request: SpotlightRequestable)  {
        saveCallCount += 1
        if let saveHandler = saveHandler {
            saveHandler(request)
        }
        
    }
}

public class ItemListRepositoryMock: ItemListRepository {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: (() throws -> (ItemListResponse))?
    public func get() throws -> ItemListResponse {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler()
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class PokemonListRepositoryMock: PokemonListRepository {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: (() throws -> (PokemonListResponse))?
    public func get() throws -> PokemonListResponse {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler()
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class PokemonSpeciesRepositoryMock: PokemonSpeciesRepository {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: ((Int) throws -> (PokemonSpeciesResponse))?
    public func get(number: Int) throws -> PokemonSpeciesResponse {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler(number)
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class EvolutionChainRepositoryMock: EvolutionChainRepository {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: ((Int) throws -> (EvolutionChainResponse))?
    public func get(id: Int) throws -> EvolutionChainResponse {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler(id)
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class PokemonSpeciesUseCaseMock: PokemonSpeciesUseCase {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: ((Int) throws -> (PokemonSpeciesModel))?
    public func get(number: Int) throws -> PokemonSpeciesModel {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler(number)
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class ItemListUseCaseMock: ItemListUseCase {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: (() throws -> (ItemListModel))?
    public func get() throws -> ItemListModel {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler()
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class ItemDetailUseCaseMock: ItemDetailUseCase {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: ((Int) throws -> (ItemDetailModel))?
    public func get(number: Int) throws -> ItemDetailModel {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler(number)
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class PokemonListUseCaseMock: PokemonListUseCase {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: (() throws -> (PokemonListModel))?
    public func get() throws -> PokemonListModel {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler()
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class PokemonDetailUseCaseMock: PokemonDetailUseCase {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: ((Int) throws -> (PokemonDetailModel))?
    public func get(number: Int) throws -> PokemonDetailModel {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler(number)
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class EvolutionChainUseCaseMock: EvolutionChainUseCase {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: ((Int) throws -> (EvolutionChainModel))?
    public func get(id: Int) throws -> EvolutionChainModel {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler(id)
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }
}

public class ItemDetailRepositoryMock: ItemDetailRepository {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: ((Int) throws -> (ItemDetailResponse))?
    public func get(number: Int) throws -> ItemDetailResponse {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler(number)
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }

    public private(set) var saveSpotlightCallCount = 0
    public var saveSpotlightHandler: ((Int, String, URL?) -> ())?
    public func saveSpotlight(number: Int, name: String, imageUrl: URL?)  {
        saveSpotlightCallCount += 1
        if let saveSpotlightHandler = saveSpotlightHandler {
            saveSpotlightHandler(number, name, imageUrl)
        }
        
    }
}

public class PokemonDetailRepositoryMock: PokemonDetailRepository {
    public init() { }


    public private(set) var getCallCount = 0
    public var getHandler: ((Int) throws -> (PokemonDetailResponse))?
    public func get(number: Int) throws -> PokemonDetailResponse {
        getCallCount += 1
        if let getHandler = getHandler {
            return try getHandler(number)
        }
        fatalError("getHandler returns can't have a default value thus its handler must be set")
    }

    public private(set) var saveSpotlightCallCount = 0
    public var saveSpotlightHandler: ((Int, String, URL?) -> ())?
    public func saveSpotlight(number: Int, name: String, imageUrl: URL?)  {
        saveSpotlightCallCount += 1
        if let saveSpotlightHandler = saveSpotlightHandler {
            saveSpotlightHandler(number, name, imageUrl)
        }
        
    }
}

