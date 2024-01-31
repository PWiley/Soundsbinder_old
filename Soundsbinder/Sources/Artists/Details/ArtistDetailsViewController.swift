//
//  ArtistDetailsViewController.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit

final class ArtistDetailsViewController: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public Properties
    
    var viewModel: ArtistDetailsViewModel!
    
    // MARK: - Private Properties
    
    private lazy var source: ArtistDetailsDataSource = {
        return ArtistDetailsDataSource(
            tableView: tableView,
            viewModel: viewModel)
    }()
   
  
    // MARK: - Init
    

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = source
        tableView.delegate = source
        bind(to: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillappear()
    }
    
    // MARK: - Private
    
    private func bind(to viewModel: ArtistDetailsViewModel) {
        viewModel.titleText = { [weak self] title in
            self?.title = title
        }

        viewModel.items = { [weak self] viewModelItems in
            let dataSourceItems = viewModelItems.map { viewModelItem in
                return ArtistDetailsDataSource.AlbumSource(
                    albumId: viewModelItem.albumId,
                    title: viewModelItem.title,
                    coverImageUrl: viewModelItem.coverImageUrl
                )
            }
            
            DispatchQueue.main.async {
                self?.source.update(with: dataSourceItems)
                self?.tableView.reloadData()
            }
        }
    }
}
