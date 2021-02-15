//
//  TimeScheduleCollectionView.swift
//  GJFitness
//
//  Created by James S on 13/2/2564 BE.
//
// change jame problem

import UIKit

class TimeScheduleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeslot: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timeslot.layer.cornerRadius = 5
        timeslot.layer.masksToBounds = true
    }
}
 
