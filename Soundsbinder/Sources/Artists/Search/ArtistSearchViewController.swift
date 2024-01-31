//
//  ArtistSearchViewController.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit

final class ArtistSearchViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var collection: UICollectionView!
        
    // MARK: - Public Properties
    
    var viewModel:  ArtistSearchViewModel!
    var imageProvider: ImageProvider!
    var repository: ArtistSearchRepository!
    
    // MARK: - Private Properties
    
    private lazy var source: ArtistSearchDataSource = {
        return ArtistSearchDataSource(imageProvider: imageProvider)
    }()
    
    private lazy var searchController = UISearchController(searchResultsController: nil)
        
    private var artists: [VisibleTrack] = []
    
    // MARK: - Init
    
  
    
    // MARK: - View Life Cycle
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = source
        collection.delegate = source

        bind(to: viewModel)
        bind(to: source)
        
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
    }

    // MARK: - Private
      
    private func bind(to viewModel: ArtistSearchViewModel) {
        viewModel.items = { [weak self] artists in
            DispatchQueue.main.async {
                self?.source.update(with: artists)
                self?.collection.contentOffset = .zero
                self?.collection.reloadData()
            }
        }

        viewModel.screenTitle = { [weak self] title in
            self?.title = title
        }
    }
    
    private func bind(to source: ArtistSearchDataSource) {
        source.didSelectItemAtIndex = viewModel.didSelectItem
    }
    
//    private func handleTableViewData() {
//        if let _ = self.viewModel.items {
//            collectionView.reloadData()
//        }
//    }
    
}

extension ArtistSearchViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let name = searchController.searchBar.text else { return }
        viewModel.didPressSearch(for: name)
    }
    
}
