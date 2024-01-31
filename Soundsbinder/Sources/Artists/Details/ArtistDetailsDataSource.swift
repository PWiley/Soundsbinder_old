//
//  ArtistDetailsDataSource.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit


final class ArtistDetailsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    struct AlbumSource: Equatable {
        let albumId: Int
        let title: String
        let coverImageUrl: String
    }
    
    struct AlbumTrackListSource: Equatable {
        let title: String
        let link: String
        let duration: Int
        let trackPosition: Int
        let diskNumber: Int
    }
    // MARK: Initializer
    
    init(tableView: UITableView,
         viewModel: ArtistDetailsViewModel){
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.viewModel = viewModel
    }
    
    var viewModel: ArtistDetailsViewModel!
    
    private var items: [AlbumSource] = []
    
    func update(with items: [AlbumSource]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TrackTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TrackTableViewCell
        
        return TrackTableViewCell
    }
    
    
}


