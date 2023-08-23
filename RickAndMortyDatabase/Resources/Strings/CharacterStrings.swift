//
//  CharacterStrings.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 15/08/23.
//

import Foundation

enum CharacterUIIdentifier: String {
    case navigationBar = "charactersNavigationBar"
    case navigationBarBackButton = "charactersNavigationBarBackButton"
    case collectionView = "collectionView"
    case filterNavigationButton = "filterNavigationButton"
    //Filter
    case filterTitle = "filterTitle"
    case filterName = "filterCharacterName"
    case filterStatus = "filterCharacterStatus"
    case filterClearButton = "filterClearButton"
    case filterApplyButton = "filterApplyButton"
    case filterStatusActionAlive = "filterStatusActionAlive"
    case filterStatusActionDead = "filterStatusActionDead"
    case filterStatusActionUnknown = "filterStatusActionUnknown"
    //Detail
    case detailImage = "detailImageView"
    case detailSpeciesTitle = "detailSpeciesTitle"
    case detailSpecies = "detailSpecies"
    case detailGenderTitle = "detailGenderTitle"
    case detailGender = "detailGender"
    case detailStatusTitle = "detailStatusTitle"
    case detailStatus = "detailStatus"
    case detailOriginTitle = "detailOriginTitle"
    case detailOrigin = "detailOrigin"
    
    var text: String {
        switch self {
        default: return rawValue
        }
    }
}

enum CharacterStrings: String {
    case charactersTitle = "charactersTitle"
    //Filter
    case filterTitle = "characterFilterTitle"
    case filterNamePlaceholder = "characterFilterNamePlaceholder"
    case filterStatusPlaceholder = "characterFilterStatusPlaceholder"
    case filterClearButtonText = "characterFilterClearButtonText"
    case filterApplyButtonText = "characterFilterApplyButtonText"
    //Detail
    case species = "characterSpecies"
    case status = "characterStatus"
    case statusAlive = "characterStatusAlive"
    case statusDead = "characterStatusDead"
    case statusUnknown = "characterStatusUnknown"
    case gender = "characterGender"
    case genderMale = "characterGenderMale"
    case genderFemale = "characterGenderFemale"
    case genderGenderless = "characterGenderGenderless"
    case genderUnknown = "characterGenderUnknown"
    case origin = "characterOrigin"

    var text: String {
        switch self {
        default: return NSLocalizedString(rawValue, comment: "")
        }
    }
}
