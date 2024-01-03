//
//  TrackTableViewCell.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    // trackNumber -- trackTitle -- trackDuration
    
    private lazy var trackNumber: UILabel = {
        let number = UILabel()
        number.text = ""
        number.textColor = .red
        number.textAlignment = .center
        number.numberOfLines = 1
        return number
    }()
    
    private lazy var trackTitle: UILabel = {
        let title = UILabel()
        title.backgroundColor = .blue
        title.text = ""
        title.textColor = .black
        title.textAlignment = .center
        title.numberOfLines = 1
        return title
    }()
    
    private lazy var trackDuration: UILabel = {
        let albumTitle = UILabel()
        albumTitle.backgroundColor = .red
        albumTitle.text = ""
        albumTitle.textColor = .black
        albumTitle.textAlignment = .center
        albumTitle.numberOfLines = 1
        return albumTitle
    }()
    
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
        
//        contentView.addSubview(trackNumber)
//        trackNumber.snp.makeConstraints {
//            $0.height.width.equalTo(30)
//            $0.leading.top.equalToSuperview()
//        }
//
//        contentView.addSubview(trackTitle)
//        trackTitle.snp.makeConstraints {
//            $0.leading.equalTo(trackNumber.snp.trailing)
//            $0.trailing.top.equalToSuperview()
//            $0.height.equalTo(contentView).dividedBy(2)
//        }
//        contentView.addSubview(trackDuration)
//        trackDuration.snp.makeConstraints {
//            $0.leading.equalTo(trackNumber.snp.trailing)
//            $0.trailing.bottom.equalToSuperview()
//            $0.height.equalTo(contentView).dividedBy(2)
//        }

    }
    
    // MARK: - Setup

    override func prepareForReuse() {
        super.prepareForReuse()
        self.trackNumber.text = "trackNumber"
        self.trackTitle.text = "trackTitle"
        self.trackDuration.text = "trackDuration"
    }

    func configure(track: VisibleTrack) {
        self.trackNumber.text = String(track.trackNumber)
        self.trackTitle.text = track.trackTitle
        self.trackDuration.text = String(track.trackDuration)
       
        }
    }

