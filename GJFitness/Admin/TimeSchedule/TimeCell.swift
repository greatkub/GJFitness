//
//  TimeCell.swift
//  GJFitness
//
//  Created by James S on 12/2/2564 BE.
//

import UIKit

class TimeCell: UICollectionViewCell {
    @IBOutlet var timeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timeButton.backgroundColor = .yellow
        timeButton.layer.cornerRadius = 10
    }
}
