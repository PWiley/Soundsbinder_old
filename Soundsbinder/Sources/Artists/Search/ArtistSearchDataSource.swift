//
//  ArtistSearchDataSource.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit

final class ArtistSearchDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Private Properties
    
    private var artists: [VisibleArtist] = []
    
    // MARK: - Public Properties
    
    var imageProvider: ImageProvider
    var didSelectItemAtIndex: ((Int) -> Void)?
    
    // MARK: - Initializer

    init(imageProvider: ImageProvider) {
        self.imageProvider = imageProvider
    }

    
    // MARK: - UICollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let artistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCollectionViewCell", for: indexPath) as! ArtistCollectionViewCell
        artistCell.configure(with: artists[indexPath.row], imageProvider: imageProvider)
        return artistCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        guard indexPath.item < artists.count else {
            fatalError()
        }
        didSelectItemAtIndex?(index)
    }
    
    func update(with artists: [ArtistSearchViewModel.Artist]) {
        self.artists = artists.map {
            VisibleArtist(artist: $0)
        }
    }
    
}

extension ArtistSearchDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 32) / 3
        return CGSize(width: width, height: width + 60.0)
    }
}
