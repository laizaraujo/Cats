//
//  BreedsListViewController.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

protocol BreedsListViewControllerProtocol {
    func navigateToDetails(breed: Breed)
}

class BreedsListViewController: UIViewController {
    
    var viewModel: BreedsListViewModelProtocol? = BreedsListViewModel()
    var delegate: BreedsListViewControllerProtocol?
    var collection: UICollectionView!
    let loadView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.backgroundColor = .clear
        loader.color = .white
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeCollection()
        initializeClosures()
        viewModel?.loadBreeds()
    }
    
    /// Collection initialization
    /// - Set collection delegate, data source and layout
    /// - Register the collection cell
    /// - Add collection constraints
    func initializeCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self

        collection.register(UINib(nibName: "BreedsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "breeds")
        collection.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.137254902, blue: 0.1921568627, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.137254902, blue: 0.1921568627, alpha: 1)
        view.addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true        
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

extension BreedsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = 10
        let collums = 2
        let availableWidth = Int(UIScreen.main.bounds.width) - (paddingSpace * (collums + 1))

        let widthPerItem  = availableWidth/collums

        return CGSize(width: CGFloat(widthPerItem), height: CGFloat(widthPerItem))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
}

extension BreedsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let breed = viewModel?.breeds[indexPath.row] else { return }
        delegate?.navigateToDetails(breed: breed)
    }
}

extension BreedsListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.breeds.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: "breeds", for: indexPath) as? BreedsCollectionViewCell,
            let breed = viewModel?.breeds[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.viewModel.setBreedInformation(image: breed.getImageURL(), name: breed.name, origin: breed.origin)
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
            view.addSubview(loadView)
            view.bringSubviewToFront(loadView)
            loadView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            loadView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loadView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            loadView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        } else {
            loadView.removeFromSuperview()
            loadView.topAnchor.constraint(equalTo: view.topAnchor).isActive = false
            loadView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = false
            loadView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = false
            loadView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = false
        }
    }
}
