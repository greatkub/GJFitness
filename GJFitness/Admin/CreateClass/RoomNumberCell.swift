//
//  RoomNumberCell.swift
//  GJFitness
//
//  Created by James S on 14/2/2564 BE.

import UIKit

class RoomNumberCell: UICollectionViewCell {
    @IBOutlet var roomNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        roomNumber.textColor = .white
        self.contentView.backgroundColor = .systemGray3
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
    }
}

