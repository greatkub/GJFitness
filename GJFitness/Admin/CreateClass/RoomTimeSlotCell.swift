//
//  RoomTimeSlotCell.swift
//  GJFitness
//
//  Created by James S on 14/2/2564 BE.
//

import UIKit

class RoomTimeSlotCell: UICollectionViewCell {
    @IBOutlet var roomTimeSlot: UILabel!
    
    override func awakeFromNib() {
        roomTimeSlot.layer.cornerRadius = 5
        roomTimeSlot.layer.masksToBounds = true
    }
}
