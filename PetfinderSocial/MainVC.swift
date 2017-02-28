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
        
//        let req = PFSGetRandomPetRequest()
//        req.location = "10012"
//        service.fetchRandomPet(withRequest: req) { (result, error) in
//            guard let result = result else {
//                if let error = error {
//                    print("Error!!! Error = \(error.errorDescription)")
//                }
//                return
//            }
//            debugPrint(result)
//        }
        
        let req = PFSGetPetByIdRequest(withPetId: 36004233)
        service.getPetById(withRequest: req) { (result, error) in
            guard let result = result else {
                if let error = error {
                    print("Error fetching a pet by id. Error: \(error.errorDescription)")
                }
                return
            }
            debugPrint(result)
        }
    }
}
