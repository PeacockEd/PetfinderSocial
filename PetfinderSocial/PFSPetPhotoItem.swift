//
//  PFSPetPhotoItem.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 1/31/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum PFSPetPhotoSize: String {
    // large (max 500x500)
    case x      = "x"
    // thumbnail (max 50 pixels high)
    case t      = "t"
    // petnote (max 300x250)
    case pn     = "pn"
    // petnote thumbnail (max 60 pixels wide)
    case pnt    = "pnt"
    // featured pet module (max 95 pixels wide)
    case fpm    = "fpm"
    // none
    case none   = "none"
    
    static func createPetPhotoSizeItem(withSize size: String?) -> PFSPetPhotoSize {
        var sizeType = PFSPetPhotoSize.none
        guard let size = size?.lowercased() else {
            return sizeType
        }
        
        switch size {
            case "x":
                sizeType = .x
            case "t":
                sizeType = .t
            case "pn":
                sizeType = .pn
            case "pnt":
                sizeType = .pnt
            case "fpm":
                sizeType = .fpm
            default:
                sizeType = .none
        }
        return sizeType
    }
}

struct PFSPetPhotoItem {
    
    private var _id: String?
    private var _size: PFSPetPhotoSize?
    private var _url: String?
    private var _data: [String: JSON]?
    
    init(data: [String: JSON]) {
        _data = data
        parseItemData()
    }
    
    private mutating func parseItemData() {
        //print(_data)
        guard let data = _data,
            let id = data["@id"]?.string,
            let size = data["@size"]?.string,
            let url = data[PFSConstants.keyContentProperty]?.string else {
                return
        }
        _id = id
        _size = PFSPetPhotoSize.createPetPhotoSizeItem(withSize: size)
        _url = url
    }
    
    static func createPhotoItem(withDictionary data: [String: JSON]) -> PFSPetPhotoItem {
        return self.init(data: data)
    }
    
    var id: String? {
        get {
            return _id
        }
    }
    
    var size: PFSPetPhotoSize? {
        get {
            return _size
        }
    }
    
    var url: String? {
        get {
            return _url
        }
    }
}
