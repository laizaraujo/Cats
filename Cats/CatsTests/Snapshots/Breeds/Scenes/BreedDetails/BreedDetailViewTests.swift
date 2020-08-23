//
//  BreedDetailViewTests.swift
//  CatsTests
//
//  Created by Laiza Souza on 22/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Cats

class BreedDetailViewTests: QuickSpec {

    override func spec() {
        describe("BreedDetailView") {
            it("have valid snapshot") {
                let url = Bundle(for: type(of: self)).url(forResource: "abys", withExtension: "jpg")
                let image = Image(url: url!, width: 1024, height: 1024)
                let breed = Breed(adaptability: 1, affectionLevel: 2, childFriendly: 3, description: "The Abyssinian is easy to care for, and a joy have in your home. They're affectionate cats and love both people and other animals.", dogFriendly: 4, energyLevel: 5, id: "asad", name: "Abyssinian", origin: "Egypt", temperament: "Active, Energetic, Independent, Intelligent, Gentle", image: image)
                let view: BreedDetailView = BreedDetailView.fromNib()
                
                view.setInformation(breed: breed)
                
                waitUntil(timeout: 2) { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                        expect(view).to(haveValidSnapshot(named: "BreedDetailView_abyssinian"))
                        done()
                    }
                }
            }
        }
    }
    
}
