//
//  BreedDetailsViewController.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

class BreedDetailsViewController: UIViewController {
    var breed: Breed?
    var scroll = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Theme.primary
        
        initializeScroll()
        
        guard let breed = breed else { return }
        
        title = breed.name
        initializeDetail(breed: breed)
    }
    
    /// Insert scrollView to controller
    private func initializeScroll() {
        view.addSubview(scroll)
        scroll.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    /// Initialize the BreedDetailView information and insert it in the scroll
    private func initializeDetail(breed: Breed) {
        let detailsView: BreedDetailView = BreedDetailView.fromNib()
        detailsView.setInformation(breed: breed)
        scroll.addSubview(detailsView)
        
        detailsView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.scroll)
            make.width.equalTo(self.view)
        }
    }

}
