//
//  BreedsListViewController.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Lottie
import UIKit

protocol BreedsListViewControllerProtocol {
    func navigateToDetails(breed: Breed)
}

class BreedsListViewController: UIViewController {
    
    var viewModel: BreedsListViewModelProtocol? = BreedsListViewModel()
    var delegate: BreedsListViewControllerProtocol?
    var collection: UICollectionView!
    
    private var loadingView: AnimationView = {
        let name = UIScreen.main.traitCollection.userInterfaceStyle == .dark ? "loader-dark" : "loader-light"
        let animation = Lottie.AnimationView(name: name)
        animation.loopMode = .loop
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.contentMode = .scaleToFill
        return animation
    }()

    var widthPerItem: CGFloat {
        let paddingSpace = 10
        let collums = 2
        let availableWidth = UIScreen.main.bounds.width - CGFloat(paddingSpace * (collums + 1))
        return availableWidth / CGFloat(collums)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = BreedStrings.appName.localizable

        initializeCollection()
        initializeClosures()
        viewModel?.loadBreeds()
    }
    
    /// Collection initialization
    /// - Set collection delegate, data source and layout
    /// - Register the collection cell
    /// - Add collection constraints
    func initializeCollection() {
        let layout = UICollectionViewStackedLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        collection.dataSource = self
        collection.delegate = self

        collection.register(UINib(nibName: "BreedsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: BreedsCollectionViewCell.reuseIdentifier)
        
        collection.backgroundColor = UIColor.Theme.primary
        view.backgroundColor = UIColor.Theme.primary
        
        view.addSubview(collection)
        collection.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    /// Closures initialization
    /// - breeds update method
    /// - display error methos
    /// - show loading method
    func initializeClosures() {
        viewModel?.breedsUpdated = breedsUpdated
        viewModel?.displayError = displayError(message:)
        viewModel?.showLoading = showLoading(_:)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension BreedsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
}

// MARK: UICollectionViewDelegate
extension BreedsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let breed = viewModel?.breeds[indexPath.row] else { return }
        delegate?.navigateToDetails(breed: breed)
    }
}

// MARK: UICollectionViewDataSource
extension BreedsListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.breeds.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: BreedsCollectionViewCell.reuseIdentifier, for: indexPath) as? BreedsCollectionViewCell,
            let breed = viewModel?.breeds[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.widthConstraint.constant = widthPerItem
        cell.viewModel.setBreed(breed)
        
        return cell
    }
}

extension BreedsListViewController {
    /// Updates breeds information
    /// Reload collection data
    func breedsUpdated() {
        collection.reloadData()
    }
    
    /// Displays error alert with retry button
    /// - Parameters:
    ///     - message: The message to show in alert
    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Retry", style: .default) { _ in
            self.viewModel?.loadBreeds()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    /// Shows loading
    /// - Parameters:
    ///     - load: A Bool that defines wheter the loadind should be showned
    /// Add load view and it's constraints
    func showLoading(_ load: Bool) {
        if load {
            view.addSubview(loadingView)
            view.bringSubviewToFront(loadingView)
            loadingView.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.view.snp.centerX)
                make.centerY.equalTo(self.view.snp.centerY)
                make.width.equalTo(280)
                make.height.equalTo(200)
            }
            loadingView.play()
        } else {
            loadingView.stop()
            loadingView.removeFromSuperview()
        }
    }
}
