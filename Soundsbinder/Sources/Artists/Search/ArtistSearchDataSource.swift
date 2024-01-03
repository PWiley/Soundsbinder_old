//
//  ArtistSearchDataSource.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit

final class ArtistSearchDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Private Properties
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    //private let itemsPerRow: CGFloat = 3
    private let reuseIdentifier = "ArtistCell"
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
        let artistCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ArtistCollectionViewCell
        //artistCell.configure(artist: artists[indexPath.row])
//        artistCell.configure(with: <#T##VisibleArtist#>, imageProvider: <#T##ImageProvider?#>)
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (3 + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        //let widthPerItem = availableWidth / itemsPerRow
        let widthPerItem = availableWidth / 3

        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int)-> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
