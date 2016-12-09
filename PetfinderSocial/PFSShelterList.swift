//
//  PFSShelterList.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 12/9/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ShelterListItems = Array<PFSShelterItem>

struct PFSShelterList {
    
    private var _items = ShelterListItems()
    
    init(data: JSON)
    {
        parseShelterListData(data: data)
    }
    
    mutating private func parseShelterListData(data: JSON)
    {
        _items = ShelterListItems()
        
        guard let shelterList = data[PFSConstants.keyPetfinder]["shelters"]["shelter"].array else {
            // TODO: Handle error in some way
            return
        }
        
        for shelter in shelterList {
            debugPrint(shelter)
        }
    }
    
    static func shelterListFromJSON(data: JSON) -> PFSShelterList
    {
        return self.init(data: data)
    }
    
    var items: ShelterListItems {
        get {
            return _items
        }
    }
}
