//
//  BreedsListViewTests.swift
//  CatsTests
//
//  Created by Laiza Souza on 22/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Cats

class BreedsListViewTests: QuickSpec {
    
    class BreedsListViewModelTest: BreedsListViewModelProtocol {
        var breedsUpdated: (() -> Void)?
        var displayError: ((String) -> Void)?
        var showLoading: ((Bool) -> Void)?

        var breeds: [Breed] = []

        func setBreeds(_ breeds: [Breed]) {
            self.breeds = breeds
        }
        
        func loadBreeds() {
        }
    }
    
    override func spec() {
        describe("BreedsListView") {
            var controller: BreedsListViewController!
            var viewModel = BreedsListViewModelTest()
            
            beforeEach {
                controller = BreedsListViewController()
                controller.viewModel = viewModel
                
                _ = controller.view
            }
            
            context("when it is loading") {
                it("have valid snapshot") {
                    viewModel.showLoading?(true)
                    
                    expect(controller.view).to(haveValidSnapshot(named: "BreedsListView_loading"))
                }
            }
            
            context("when it is displaying breeds") {
                it("have valid snapshot") {
                    let abysUrl = Bundle(for: type(of: self)).url(forResource: "abys", withExtension: "jpg")
                    let abysImage = Image(url: abysUrl!, width: 1024, height: 1024)
                    let abys = Breed(adaptability: 1, affectionLevel: 2, childFriendly: 3, description: "", dogFriendly: 4, energyLevel: 5, id: "", name: "Abyssinian", origin: "Egypt", temperament: "", image: abysImage)
                    
                    let aege = Breed(adaptability: 1, affectionLevel: 2, childFriendly: 3, description: "", dogFriendly: 4, energyLevel: 5, id: "", name: "Aegean", origin: "Greece", temperament: "")

                    let breeds = [abys, aege, aege, abys]
                    
                    viewModel.setBreeds(breeds)
                    viewModel.breedsUpdated?()
                    
                    waitUntil(timeout: 4) { done in
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                            expect(controller.view).to(haveValidSnapshot(named: "BreedsListView_breeds"))
                            done()
                        }
                    }
                }
            }
        }
    }

}
