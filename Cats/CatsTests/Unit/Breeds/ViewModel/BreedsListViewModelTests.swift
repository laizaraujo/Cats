//
//  BreedsListViewModelTests.swift
//  CatsTests
//
//  Created by Laiza Souza on 20/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Quick
import Nimble
import Alamofire

@testable import Cats

/// Mock API
class BreedsListApiTest: BreedApiClientProtocol {
    enum BreedsListTestCase {
        case list([Breed])
        case listAndImage([Breed], [Image])
        case failure
    }
    
    var testCase: BreedsListTestCase = .list([])
    
    func listBreeds(completion: @escaping (Result<[Breed], Error>) -> Void) {
        switch testCase {
        case .list(let breeds), .listAndImage(let breeds, _):
            completion(.success(breeds))
        default:
            let error = AFError.explicitlyCancelled
            completion(.failure(error))
        }
    }
    
    func imageSearch(breedId: String, completion: @escaping (Result<[Image], Error>) -> Void) {
        switch testCase {
        case .listAndImage(_, let images):
            completion(.success(images))
        default:
            let error = AFError.explicitlyCancelled
            completion(.failure(error))
        }
    }
}

class BreedsListViewModelTests: QuickSpec {
    
    override func spec() {
        var api: BreedsListApiTest!
        var viewModel: BreedsListViewModel!

        beforeEach {
            api = BreedsListApiTest()
            viewModel = BreedsListViewModel(api: api)
        }
        
        describe("Breed list view model") {
            describe("load breeds") {
                var breedsUpdatedCalled = false
                var displayErrorCalled = false
                
                beforeEach {
                    breedsUpdatedCalled = false
                    viewModel.breedsUpdated = { breedsUpdatedCalled = true }
                    
                    displayErrorCalled = false
                    viewModel.displayError = { _ in displayErrorCalled = true }
                }
                
                context("when it receives an empty array from the API") {
                    it("updates the breeds and calls the updated closure") {
                        // Arrange
                        api.testCase = .list([])
                        
                        // Act
                        viewModel.loadBreeds()
                        
                        // Assert
                        expect(breedsUpdatedCalled).toEventually(beTrue())
                        expect(displayErrorCalled).to(beFalse())
                        
                        expect(viewModel.breeds).to(haveCount(0))
                    }
                }
                
                context("when it receives a list of breeds from the API") {
                    context("but the image search fails") {
                        it("updates the breeds and calls the updated closure") {
                            // Arrange
                            let breed = Breed(adaptability: 1, affectionLevel: 2, childFriendly: 3, description: "Description", dogFriendly: 4, energyLevel: 5, id: "asad", name: "Name", origin: "Origin", temperament: "Temperament")
                            api.testCase = .list([breed])

                            // Act
                            viewModel.loadBreeds()
                            
                            // Assert
                            expect(breedsUpdatedCalled).toEventually(beTrue())
                            expect(displayErrorCalled).to(beFalse())

                            expect(viewModel.breeds).to(haveCount(1))
                            
                            let breedResult = viewModel.breeds[0]
                            expect(breedResult.name).to(be(breed.name))
                            expect(breedResult.image).to(beNil())
                        }
                    }
                    
                    context("and it receives a list of images from the API") {
                        it("updates the breeds and calls the updated closure") {
                            // Arrange
                            let breed = Breed(adaptability: 1, affectionLevel: 2, childFriendly: 3, description: "Description", dogFriendly: 4, energyLevel: 5, id: "asad", name: "Name", origin: "Origin", temperament: "Temperament")
                            let image = Image(url: URL(string: "https://domain.com/image.jpg")!, width: 200, height: 100)
                            api.testCase = .listAndImage([breed], [image])

                            // Act
                            viewModel.loadBreeds()
                            
                            // Assert
                            expect(breedsUpdatedCalled).toEventually(beTrue())
                            expect(displayErrorCalled).to(beFalse())

                            expect(viewModel.breeds).to(haveCount(1))
                            
                            let breedResult = viewModel.breeds[0]
                            expect(breedResult.name).to(be(breed.name))
                            expect(breedResult.image).notTo(beNil())
                            
                            let imageResult = breedResult.image
                            expect(imageResult?.width).to(be(200))
                            expect(imageResult?.height).to(be(100))
                        }
                    }
                }
                
                context("when it receives an error response from the API") {
                    it("calls the error closure") {
                        // Arrange
                        api.testCase = .failure
                        
                        // Act
                        viewModel.loadBreeds()
                        
                        // Assert
                        expect(displayErrorCalled).toEventually(beTrue())
                        expect(breedsUpdatedCalled).to(beFalse())
                    }
                }
            }
        }
    }
    
}
