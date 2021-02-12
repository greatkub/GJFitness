//
//  RoomViewCell.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 8/2/2564 BE.
//

import UIKit

class RoomViewCell: UITableViewCell {
    @IBOutlet var room: UILabel!
    
    @IBOutlet var trainer: UILabel!
    
    @IBOutlet weak var slotCollection: UICollectionView!
    var counter = 0
//    var timeDisplay = ["10:00", "12:00", "15:00", "16:00", "17:00" , "18:00"]
    
    var timeslotsColor:[UIColor] = []
    var timeslots: [String] = []
    
    override func awakeFromNib() {
//        print(timeDisplay.count)
        
        self.slotCollection.delegate = self
        self.slotCollection.dataSource = self
    }
   
}
extension RoomViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeslots.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slotTimeCell", for: indexPath) as! SlotCollectionViewCell

    
//        print(indexPath)
//
//        if indexPath.row < 3 {
//            for i in 0...timeDisplay2d[indexPath.row].count-1 {
//                if indexPath.row < 3 {
//                    cell.displayTimeSlot.text = timeDisplay2d[indexPath.row][i]
//                    print(timeDisplay2d[indexPath.row][i])
//                }
//            }
//        }
//
        cell.displayTimeSlot.text = timeslots[indexPath.row]
        cell.displayTimeSlot.backgroundColor = timeslotsColor[indexPath.row]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(timeslots[indexPath[1]])")
    }
}
