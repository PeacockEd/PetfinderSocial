//
//  PFSBreedListRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 11/29/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSBreedListRequest: PFSBaseRequest {
    
    init(forAnimal animal: PFSAnimalType)
    {
        super.init(apiMethod: .BreedList)
        urlParams.updateValue(animal.rawValue, forKey: PFSConstants.paramAnimalKey)
    }
}
