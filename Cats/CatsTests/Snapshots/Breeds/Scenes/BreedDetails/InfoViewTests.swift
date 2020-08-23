//
//  InfoViewTests.swift
//  CatsTests
//
//  Created by Laiza Souza on 22/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Cats

class InfoViewTests: QuickSpec {

    override func spec() {
        describe("InfoView") {
            it("have valid snapshots for different levels") {
                let view: InfoView = InfoView.fromNib()
                
                for level in 0...5 {
                    view.setInformation(level: level, attribute: "Attribute")
                    expect(view).to(haveValidSnapshot(named: "InfoView_level_\(level)"))
                }
            }
        }
    }
    
}
