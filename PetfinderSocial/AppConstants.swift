//
//  AppConstants.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 11/23/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

struct APIConstants {
    static let API_BASE_URL = "https://api.petfinder.com/"
}

struct PFSConstants {
    // API defaults
    static let defaultRecordCount   = 25
    static let defaultRecordOffset  = 0
    static let recodLastOffset      = "lastOffset"
    
    // API parameter names/keys
    static let paramKey             = "key"
    static let paramFormat          = "format"
    static let paramOutput          = "output"
    static let paramAnimalKey       = "animal"
    static let paramBreedKey        = "breed"
    static let paramGenericIdKey    = "id"
    static let paramSizeKey         = "size"
    static let paramSexKey          = "sex"
    static let paramAgeKey          = "age"
    static let paramLocationKey     = "location"
    static let paramShelterNameKey  = "name"
    static let paramShelterIdKey    = "shelterid"
    static let paramOffsetKey       = "offset"
    static let paramCountKey        = "count"

    // Content description keys
    static let keyContentProperty   = "$t"
    static let keyPetfinder         = "petfinder"
    static let keyBreeds            = "breeds"
    static let keyBreed             = "breed"
    
    static let keyPet               = "pet"
    static let keyPetName           = "name"
    static let keyPetId             = "id"
    static let keyPetAnimal         = "animal"
    static let keyPetAge            = "age"
    static let keyPetSex            = "sex"
    static let keyPetSize           = "size"
    
    static let keyShelterId         = "shelterId"
    static let keyShelterState      = "state"
    static let keyShelterCity       = "city"
    static let keyShelterAddress1   = "address1"
    static let keyShelterAddress2   = "address2"
    static let keyShelterZip        = "zip"
    static let keyShelterCountry    = "country"
    static let keyShelterName       = "name"
    static let keyShelterEmail      = "email"
    static let keyShelterPhone      = "phone"
    static let keyShelterFax        = "fax"
    static let keyShelterLatitude   = "latitude"
    static let keyShelterLongitude  = "longitude"
    
    static let keyPetOptions        = "options"
    static let keyPetOption         = "option"
    static let keyPetMix            = "mix"
    static let keyPetShelterId      = "shelterPetId"
    static let keyPetStatus         = "status"
    static let keyPetDescription    = "description"
    static let keyPetLastUpdate     = "lastUpdate"
    static let keyPetContact        = "contact"
}

public enum PFSAnimalType: String {
    case barnyard   = "barnyard"
    case bird       = "bird"
    case cat        = "cat"
    case dog        = "dog"
    case horse      = "horse"
    case pig        = "pig"
    case reptile    = "reptile"
    case smallfurry = "smallfurry"
    case none       = "none"
    
    static func createAnimalType(forAnimal animal: String?) -> PFSAnimalType
    {
        var petType = PFSAnimalType.none
        guard let type = animal?.lowercased() else {
            return petType
        }
        
        switch type {
        case "barnyard" :
            petType = .barnyard
        case "bird" :
            petType = .bird
        case "cat" :
            petType = .cat
        case "dog" :
            petType = .dog
        case "horse" :
            petType = .horse
        case "pig" :
            petType = .pig
        case "reptile" :
            petType = .reptile
        case "smallfurry" :
            petType = .smallfurry
        default :
            petType = .none
        }
        return petType
    }
}

public enum PFSSizeType: String {
    case small          = "S"
    case medium         = "M"
    case large          = "L"
    case extra_large    = "XL"
    case none           = "none"
    
    static func createSizeType(forSize size: String?) -> PFSSizeType {
        var sizeType = PFSSizeType.none
        guard let size = size?.lowercased() else {
            return sizeType
        }
        
        switch size {
        case "s":
            sizeType = .small
        case "m":
            sizeType = .medium
        case "l":
            sizeType = .large
        case "xl":
            sizeType = .extra_large
        default:
            sizeType = .none
        }
        return sizeType
    }
}

public enum PFSSexType: String {
    case male   = "M"
    case female = "F"
    case none   = "none"
    
    static func createSexType(forGender gender: String?) -> PFSSexType {
        var genderType = PFSSexType.none
        guard let gender = gender?.lowercased() else {
            return genderType
        }
        
        switch gender {
        case "m":
            genderType = .male
        case "f":
            genderType = .female
        default:
            genderType = .none
        }
        return genderType
    }
}

public enum PFSAgeType: String {
    case baby   = "Baby"
    case young  = "Young"
    case adult  = "Adult"
    case senior = "Senior"
    case none   = "none"
    
    static func createAgeType(forAge age: String?) -> PFSAgeType {
        var ageType = PFSAgeType.none
        guard let age = age?.lowercased() else {
            return ageType
        }
        
        switch age {
        case "baby":
            ageType = .baby
        case "young":
            ageType = .young
        case "adult":
            ageType = .adult
        case "senior":
            ageType = .senior
        default:
            ageType = .none
        }
        return ageType
    }
}
