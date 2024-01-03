//
//  DetailsViewController.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit
//import SnapKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: DetailsViewModel!
    
    private lazy var source: DetailsDataSource = {
        return DetailsDataSource()
    }()
    
    private lazy var DetailsTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = "Album Title"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    // MARK: - Init
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = source
        tableView.delegate = source
        setupLayout()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private
    
    private func setupLayout() {
//        view.addSubview(albumTitle)
//        albumTitle.snp.makeConstraints {
//            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide).inset(16)
//            $0.height.equalTo(30)
//        }
//        
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints {
//            $0.leading.trailing.bottom.equalTo(view).inset(16)
//            $0.top.equalTo(albumTitle.snp.bottom)
//        }
    }

    private func bind(to viewModel: DetailsViewModel) {
        viewModel.items = { [ weak self] tracks in
            DispatchQueue.main.async {
                self?.source.update(with: tracks)
                self?.tableView.reloadData()
            }
        }
    }
}
