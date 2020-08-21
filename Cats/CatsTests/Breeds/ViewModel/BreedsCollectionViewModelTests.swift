//
//  BreedsCollectionViewModelTests.swift
//  CatsTests
//
//  Created by Laiza Souza on 21/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Quick
import Nimble

@testable import Cats

class BreedsCollectionViewModelTests: QuickSpec {

    override func spec() {
        var viewModel: BreedsCollectionViewModel!
        
        beforeEach {
            viewModel = BreedsCollectionViewModel()
        }
        
        describe("Breeds collection view model") {
            describe("set breed") {
                it("calls the populate cell closure") {
                    // Arrange
                    let breed = Breed(adaptability: 1, affectionLevel: 2, childFriendly: 3, description: "Description", dogFriendly: 4, energyLevel: 5, id: "asad", name: "Name", origin: "Origin", temperament: "Temperament")
                    
                    var populateCellCalledWith: (URL?, String, String)? = nil
                    viewModel.populateCell = { (image, name, origin) in
                        populateCellCalledWith = (image, name, origin)
                    }

                    // Act
                    viewModel.setBreed(breed)

                    // Assert
                    expect(populateCellCalledWith).toNot(beNil())
                    
                    let (image, name, origin) = populateCellCalledWith!
                    expect(name).to(be(breed.name))
                    expect(origin).to(be(breed.origin))
                    expect(image).notTo(beNil())
                }
            }
        }
    }

}
