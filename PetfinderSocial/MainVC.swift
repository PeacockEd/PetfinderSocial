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
//            debugPrint(result.data)
//        })
        
//        service.findShelters(withRequest: PFSFindSheltersRequest(withLocation: "10012"), completion: { result in
//            for shelter in result.items {
//                print("The name of this shelter is: \(shelter.name)")
//            }
//        })
        
        service.fetchRandomPet(withRequest: PFSGetRandomPetRequest()) { 
            //
        }
    }
}
