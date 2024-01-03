//
//  DetailsDataSource.swift
//  Soundsbinder
//
//  Created by Patrick Wiley on 01.01.24.
//

import UIKit

final class DetailsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tracks: [VisibleTrack] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TrackTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TrackTableViewCell
        TrackTableViewCell.configure(track: tracks[indexPath.row])
        return TrackTableViewCell
    }

    func update(with tracks: [DetailsViewModel.Track]) {
        self.tracks = tracks.map { VisibleTrack(track: $0) }
    }
}
