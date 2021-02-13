//
//  RoomCell.swift
//  GJFitness
//
//  Created by James S on 13/2/2564 BE.
//

import UIKit

class RoomCell: UITableViewCell {
    @IBOutlet var roomNumber: UILabel!
    @IBOutlet var trainerName: UILabel!
    @IBOutlet weak var slotCollection: UICollectionView!

    var timeslotsList: [String] = []
    
    override func awakeFromNib() {
        self.slotCollection.delegate = self
        self.slotCollection.dataSource = self
    }
}

extension RoomCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeslotsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! TimeScheduleCollectionViewCell
        cell.timeslot.text = timeslotsList[indexPath.row]
        
        return cell
    
    }
    
}
