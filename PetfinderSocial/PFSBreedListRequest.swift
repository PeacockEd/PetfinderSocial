//
//  PFSBreedListRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 11/29/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSBreedListRequest: PFSBaseRequest {
    
    private var _animal: PFSAnimalType
    
    init(forAnimal animal: PFSAnimalType)
    {
        _animal = animal
        super.init(apiMethod: .BreedList)
        urlParams.updateValue(animal.rawValue, forKey: PFSConstants.paramAnimalKey)
    }
    
    var animal: PFSAnimalType {
        get {
            return _animal
        }
    }
}
