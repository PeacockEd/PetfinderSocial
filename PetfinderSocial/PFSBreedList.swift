//
//  PFSBreedsList.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 12/4/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias BreedList = Array<PFSBreedItem>

struct PFSBreedList {
    
    private let _animal: PFSAnimalType
    private var _items = BreedList()
    
    init(forAnimal animal: PFSAnimalType, data:[String: JSON]) {
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
    
    mutating private func parseBreedsList(data:[String: JSON]) {
        _items = BreedList()
        
        if let breedList = data[PFSConstants.keyBreed]?.dictionary {
            if let name = breedList[PFSConstants.keyContentProperty]?.string {
                _items = [PFSBreedItem(withBreedName: name)]
            }
        } else if let breedList = data[PFSConstants.keyBreed]?.array {
            for breed in breedList {
                guard let name = breed[PFSConstants.keyContentProperty].string else {
                    continue
                }
                _items.append(PFSBreedItem(withBreedName: name))
            }
        }
    }
    
    static func breedListFromDictionary(data: [String: JSON], forAnimal animal: PFSAnimalType) -> PFSBreedList {
        return self.init(forAnimal: animal, data: data)
    }
}
