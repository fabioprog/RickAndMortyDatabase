//
//  CharactersViewModel.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 10/08/23.
//

import UIKit

public enum CharactersState {
    case `default`
    case failure(String, String)
    case reloadData
    case insertRows([IndexPath])
    case loading
}

protocol CharactersViewModelDelegate {
    func observeStates(_ completion: @escaping (CharactersState) -> Void)
    func fetchCharacters(name: String?, status: String?)
    func fetchMoreCharacters()
    
    var hasMorePages: Bool { get }
    var nextUrl: String? { get set }
    var title: String { get }
    var characters: [Character] { get }
    var isLoadingMoreCharacters: Bool { get set }
    var navigator: CharactersNavigator { get set }
}

class CharactersViewModel {

    var title: String = CharacterStrings.charactersTitle.text
    var nextUrl: String?
    var hasMorePages: Bool { return nextUrl != nil }
    var isLoadingMoreCharacters: Bool = false
    var characters: [Character] = []
    let characterClient: CharacterClient
    var navigator: CharactersNavigator
    var delegate: CharactersViewModelDelegate?
    
    var state: Observable<CharactersState>
    
    required init(navigator: CharactersNavigator, client: CharacterClient) {
        self.navigator = navigator
        self.state = Observable<CharactersState>(.default)
        self.characterClient = client
    }
        
    internal func fetchCharacters(name: String?, status: String?) {
        state.notify(.loading)
        Task.init {
            do {
                let characterResponse = try await characterClient.getCharacters(page: nil, name: name, status: status)
                self.characters = characterResponse.results
                self.nextUrl = characterResponse.info.next
                DispatchQueue.main.async {
                    self.state.notify(.reloadData)
                }
            } catch {
                self.state.notify(.failure(BaseStrings.errorTitle.text,
                                           error.localizedDescription))
            }
        }
    }
    
    internal func fetchMoreCharacters() {
        if !isLoadingMoreCharacters {
            isLoadingMoreCharacters = true
            let page = nextUrl?.getURLComponentBy(key: "page")
            let name = nextUrl?.getURLComponentBy(key: "name")
            let status = nextUrl?.getURLComponentBy(key: "status")

            Task.init {
                do {
                    let characterResponse = try await characterClient.getCharacters(page: page, name: name, status: status)
                    
                    let oldCharactersCount = characters.count
                    self.characters += characterResponse.results
                    self.nextUrl = characterResponse.info.next
                    let indexPaths: [IndexPath] = Array(oldCharactersCount..<(self.characters.count)).compactMap({
                        return IndexPath(row: $0, section: 0)
                    })
                    
                    if indexPaths.count > 0 {
                        DispatchQueue.main.async {
                            self.state.notify(.insertRows(indexPaths))
                        }
                    }
                } catch {
                    self.state.notify(.failure(BaseStrings.errorTitle.text,
                                               error.localizedDescription))
                }
            }
        }
    }
}

extension CharactersViewModel: CharactersViewModelDelegate {
    func observeStates(_ completion: @escaping (CharactersState) -> Void) {
        state.observe { completion($0) }
    }
}
