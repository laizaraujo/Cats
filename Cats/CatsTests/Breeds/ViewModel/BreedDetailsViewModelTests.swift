//
//  BreedDetailsViewModelTests.swift
//  CatsTests
//
//  Created by Laiza Souza on 20/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Quick
import Nimble

class BreedDetailsViewModelTests: QuickSpec {

    func testExample() {
        
    }

}

//init(api: BreedApiClientProtocol = BreedApiClient()) {
//       self.api = api
//   }
//
//   /// Load of breeds list
//   ///     On Success: save the breeds list object and update the breeds list layout
//   ///     On Failure: show failure alert
//   func loadBreeds() {
//       showLoading?(true)
//       api.listBreeds { [weak self] (result) in
//           self?.showLoading?(false)
//           switch result {
//           case .success(let breeds):
//               self?.breeds = breeds
//           case .failure:
//               self?.displayError?("Could not load information")
//           }
//       }
//   }
