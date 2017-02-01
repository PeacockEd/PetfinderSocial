//
//  MainVC.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 11/22/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    let service = PFSDataService.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        service.fetchBreedListing(withRequest: PFSBreedListRequest(forAnimal: .cat), completion: { result in
//            print(result.items)
//        })
        
//        service.findShelters(withRequest: PFSFindSheltersRequest(withLocation: "10012"), completion: { result in
//            for shelter in result.items {
//                print("The name of this shelter is: \(shelter.name) and the ID is: \(shelter.id)")
//            }
//        })
        
        let req = PFSGetRandomPetRequest()
        //req.shelterId = "NY17"
        req.location = "10012"
        service.fetchRandomPet(withRequest: req) { result in
            debugPrint(result)
        }
    }
}
