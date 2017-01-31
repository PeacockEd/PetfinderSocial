//
//  PFSPetItem.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 1/24/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PFSPetItem {
    private var _id: String
    private var _name: String?
    private var _animal: PFSAnimalType?
    private var _age: PFSAgeType?
    private var _sex: PFSGenderType?
    private var _size: PFSSizeType?
    private var _breeds: PFSBreedList?
    private var _options: [String]?
    private var _mix: Bool?
    private var _shelterId: String?
    private var _shelterPetId: String?
    private var _status: String?
    private var _contact: PFSShelterItem?
    private var _description: String?
    private var _photos: [String]?
    private var _lastUpdated: Date?
    
    private var data: [String: JSON]?
    
    
    init?(data: JSON) {
        guard let pet = data[PFSConstants.keyPetfinder][PFSConstants.keyPet].dictionary,
            let id_dict = pet[PFSConstants.keyPetId]?.dictionary,
            let pet_id = id_dict[PFSConstants.keyContentProperty]?.string else {
            return nil
        }
        _id = pet_id
        self.data = pet
        parseItemData()
    }
    
    mutating private func parseItemData()
    {
        if let data = data {
            if let name = data[PFSConstants.keyPetName]?.dictionary,
                let value = name[PFSConstants.keyContentProperty]?.string {
                _name = value
            }
            if let animal = data[PFSConstants.keyPetAnimal]?.dictionary,
                let value = animal[PFSConstants.keyContentProperty]?.string {
                _animal = PFSAnimalType.createAnimalType(forAnimal: value)
            }
            if let age = data[PFSConstants.keyPetAge]?.dictionary,
                let value = age[PFSConstants.keyContentProperty]?.string {
                _age = PFSAgeType.createAgeType(forAge: value)
            }
            if let sex = data[PFSConstants.keyPetSex]?.dictionary,
                let value = sex[PFSConstants.keyContentProperty]?.string {
                _sex = PFSGenderType.createGenderType(forGender: value)
            }
            if let size = data[PFSConstants.keyPetSize]?.dictionary,
                let value = size[PFSConstants.keyContentProperty]?.string {
                _size = PFSSizeType.createSizeType(forSize: value)
            }
            if let breeds = data[PFSConstants.keyBreeds]?.dictionary {
                _breeds = PFSBreedList.breedListFromDictionary(data: breeds, forAnimal: _animal ?? .none)
            }
            if let options = data[PFSConstants.keyPetOptions]?.dictionary {
                if let option = options[PFSConstants.keyPetOption]?.dictionary {
                    if let value = option[PFSConstants.keyContentProperty]?.string {
                        _options = [value]
                    }
                } else if let option = options[PFSConstants.keyPetOption]?.array {
                    _options = []
                    for item in option {
                        guard let value = item[PFSConstants.keyContentProperty].string else {
                            continue
                        }
                        _options!.append(value)
                    }
                }
            }
            if let mix = data[PFSConstants.keyPetMix]?.dictionary {
                if let value = mix[PFSConstants.keyContentProperty]?.string {
                    _mix = (value.lowercased().contains("y")) ? true : false
                }
            }
            if let shelterId = data[PFSConstants.keyShelterId]?.dictionary {
                if let value = shelterId[PFSConstants.keyContentProperty]?.string {
                    _shelterId = value
                }
            }
            if let shelterPetId = data[PFSConstants.keyPetShelterId]?.dictionary {
                if let value = shelterPetId[PFSConstants.keyContentProperty]?.string {
                    _shelterPetId = value
                }
            }
            if let status = data[PFSConstants.keyPetStatus]?.dictionary {
                if let value = status[PFSConstants.keyContentProperty]?.string {
                    _status = value
                }
            }
            if let description = data[PFSConstants.keyPetDescription]?.dictionary {
                if let value = description[PFSConstants.keyContentProperty]?.string {
                    _description = value
                }
            }
            if let contact = data[PFSConstants.keyPetContact]?.dictionary {
                if let sId = _shelterId {
                    _contact = PFSShelterItem(withShelterId: sId, data: contact)
                } else {
                    _contact = PFSShelterItem.createShelterItem(withDictionary: contact)
                }
            }
            if let date = data[PFSConstants.keyPetLastUpdate]?.dictionary {
                if let value = date[PFSConstants.keyContentProperty]?.string {
                    let df = DateFormatter()
                    df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    df.timeZone = TimeZone(abbreviation: "UTC")
                    if let date = df.date(from: value) {
                        print("The date is: \(date)")
                    }
                }
            }
        }
    }
    
    static func createPetItem(withData data: JSON) -> PFSPetItem?
    {
        return self.init(data: data)
    }
    
    var id: String {
        get {
            return _id
        }
    }
    
    var name: String? {
        get {
            return _name
        }
    }
    
    var animal: PFSAnimalType? {
        get {
            return _animal
        }
    }
    
    var age: PFSAgeType? {
        get {
            return _age
        }
    }
    
    var sex: PFSGenderType? {
        get {
            return _sex
        }
    }
    
    var size: PFSSizeType? {
        get {
            return _size
        }
    }
    
    var breeds: PFSBreedList? {
        get {
            return _breeds
        }
    }
    
    var options: [String]? {
        get {
            return _options
        }
    }
    
    var mix: Bool? {
        get {
            return _mix
        }
    }

    var shelterId: String? {
        get {
            return _shelterId
        }
    }
    
    var shelterPetId: String? {
        get {
            return _shelterPetId
        }
    }
    
    var status: String? {
        get {
            return _status
        }
    }
    
    var contact: PFSShelterItem? {
        get {
            return _contact
        }
    }
    
    var description: String? {
        get {
            return _description
        }
    }
    
    var photos: [String]? {
        get {
            return _photos
        }
    }
    
    var lastUpdated: Date? {
        get {
            return _lastUpdated
        }
    }
}
