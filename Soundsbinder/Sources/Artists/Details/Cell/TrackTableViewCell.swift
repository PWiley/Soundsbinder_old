//
//  TrackTableViewCell.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit

protocol TrackTableViewCellDelegate: AnyObject {
    func trackTableViewCellDidPressPlayStop(at index: Int)
}

class TrackTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trackNumber: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var playStopTrackButton: UIButton!
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCellLayout()
    }

   
    func setupCellLayout() {
        

    }
    
    // MARK: - Setup

    override func prepareForReuse() {
        super.prepareForReuse()
        self.trackNumber.text = "trackNumber"
        self.titleLabel.text = "titleLabel"
        self.albumTitle.text = "albumTitle"
    }

    func configure(track: VisibleTrack) {
        self.trackNumber.text = String(track.trackNumber)
        self.titleLabel.text = track.trackTitle
        self.albumTitle.text = track.trackDuration
       
        }
    }

