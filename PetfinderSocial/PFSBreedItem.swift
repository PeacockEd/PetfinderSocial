//
//  PFSBreedItem.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 12/9/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

struct PFSBreedItem {
    private var _name: String
    private var _data: String
    
    init(withBreedName name: String)
    {
        _name = name
        _data = name
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var data: String {
        get {
            return _data
        }
    }
}
