//
//  PFSBreedsList.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 12/4/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum PFSAnimalType: String {
    case barnyard   = "barnyard"
    case bird       = "bird"
    case cat        = "cat"
    case dog        = "dog"
    case horse      = "horse"
    case pig        = "pig"
    case reptile    = "reptile"
    case smallfurry = "smallfurry"
}

typealias BreedList = Array<PFSBreedItem>

struct PFSBreedList {
    
    private let _animal: PFSAnimalType
    private var _items = BreedList()
    
    init(forAnimal animal: PFSAnimalType, data:JSON) {
        _animal = animal
        parseBreedsList(data: data)
    }
    
    var animal: PFSAnimalType {
        get {
            return _animal
        }
    }
    
    var items: BreedList {
        get {
            return _items
        }
    }
    
    mutating private func parseBreedsList(data:JSON) {
        _items = BreedList()
        guard let breedList = data[PFSConstants.keyPetfinder][PFSConstants.keyBreeds][PFSConstants.keyBreed].array else {
            // TODO : Handle error in some way
            return
        }
        
        for breed in breedList {
            guard let name = breed[PFSConstants.keyContentProperty].string else {
                continue
            }
            _items.append(PFSBreedItem(withBreedName: name))
        }
    }
    
    static func breedListFromJSON(data: JSON, forAnimal animal: PFSAnimalType) -> PFSBreedList {
        return self.init(forAnimal: animal, data: data)
    }
}
