//
//  ArtistSearchViewController.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit

final class ArtistSearchViewController: UIViewController {
    
    // MARK: - Outlets

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Public Properties
    
    var viewModel:  ArtistSearchViewModel!
    var imageProvider: ImageProvider!
    var repository: ArtistSearchRepository!
    
    private lazy var source: ArtistSearchDataSource = {
        return ArtistSearchDataSource(imageProvider: imageProvider)
    }()
    
    private lazy var searchController = UISearchController(searchResultsController: nil)
        
    private var artists: [VisibleTrack] = []
    
//    // MARK: - Init
//    
//    init(viewModel: ArtistSearchViewModel, imageProvider: ImageProvider, repository: ArtistSearchRepository) {
//        self.viewModel = viewModel
//        self.imageProvider = imageProvider
//        self.repository = repository
//    }
    
    // MARK: - View Life Cycle
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = source
        collectionView.delegate = source
        setupLayout()
        bind(to: viewModel)
        bind(to: source)
        viewModel.viewDidLoad()
    }

    // MARK: - Private
    
    private func setupLayout() {
        collectionView.backgroundColor = .white
        
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
       
    }
  
    private func bind(to viewModel: ArtistSearchViewModel) {
        viewModel.items = { [weak self] artists in
            DispatchQueue.main.async {
                self?.source.update(with: artists)
                self?.collectionView.contentOffset = .zero
                self?.collectionView.reloadData()
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
