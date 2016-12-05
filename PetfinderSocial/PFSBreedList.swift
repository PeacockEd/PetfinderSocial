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

struct PFSBreedList {
    
    private let _animal: PFSAnimalType;
    private var _data = [String]()
    
    init(forAnimal animal: PFSAnimalType, data:JSON) {
        _animal = animal
        _data = parseBreedsList(data: data)
    }
    
    var animal: PFSAnimalType {
        get {
            return _animal
        }
    }
    
    var data: Array<String> {
        get {
            return _data
        }
    }
    
    mutating func parseBreedsList(data:JSON) -> Array<String> {
        _data = [String]()
        guard let breedList = data[PFSConstants.keyPetfinder][PFSConstants.keyBreeds][PFSConstants.keyBreed].array else {
            // TODO : Handle error is some way
            return _data
        }
        
        for breed in breedList {
            guard let name = breed[PFSConstants.keyContentProperty].string else {
                continue
            }
            _data.append(name)
        }
        return _data
    }
}
