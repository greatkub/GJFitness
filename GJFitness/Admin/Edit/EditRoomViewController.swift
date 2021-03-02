//
//  EditRoomViewController.swift
//  GJFitness
//
//  Created by James S on 28/2/2564 BE.
//

import UIKit

class EditRoomNumberItem {
    var editRoomNumber: String = ""
    
    init(editRoomNumber: String) {
        self.editRoomNumber = editRoomNumber
    }
}

class EditTimeItem {
    var editTimeslot: String = ""
    
    init(editTimeslot: String) {
        self.editTimeslot = editTimeslot
    }
}

class EditRoomViewController: UIViewController {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var lineview: UIView!
    
    @IBOutlet var roomEditNumber: UICollectionView!
    @IBOutlet var roomEditTimeslot: UICollectionView!
    
    var editRoomNumberItems: [EditRoomNumberItem] = []
    var editRoomTimeSlots: [EditTimeItem] = []

    var roomNumbers = ["1", "2", "3", "4"]
    var roomTimeSlotList = ["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 15
        lineview.layer.cornerRadius = 2
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 50
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    }
}

//extension EditRoomViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch collectionView.tag {
//        case 1:
//            return editRoomNumberItems.count
//            
//        default:
//            return editRoomTimeSlots.count
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let index = indexPath.row
//        
//        switch collectionView.tag {
//        case 1:
//            let roomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "room_number_cell", for: indexPath) as! RoomNumberCell
//            roomCell.roomNumber.text = editRoomNumberItems[index].roomNumber
//            
//            return roomCell
//            
//        default:
//            let timeSlotCell = collectionView.dequeueReusableCell(withReuseIdentifier: "room_time_slot", for: indexPath) as! RoomTimeSlotCell
//            timeSlotCell.roomTimeSlot.text = roomTimeSlots[index].timeslot
//            
//            return timeSlotCell
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("HEEER item at \(indexPath.section)/\(indexPath.item) tapped")
//        switch collectionView.tag {
//        case 1:
//            let cell = collectionView.cellForItem(at: indexPath) as? RoomNumberCell
//            if count == 0 {
//                count = count + 1
//                cell?.contentView.backgroundColor = .systemYellow
//                
//            } else {
//                count = 0
//                cell?.contentView.backgroundColor = .systemGray3
//                
//            }
//            
//        default:
//            let cell = collectionView.cellForItem(at: indexPath) as? RoomTimeSlotCell
//            if count2 == 0 {
//                count2 = count2 + 1
//                cell?.contentView.backgroundColor = .systemYellow
//                
//            } else {
//                count2 = 0
//                cell?.contentView.backgroundColor = .systemGray3
//                
//            }
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numberOfItemsPerRow:CGFloat = 4
//        let spacingBetweenCells:CGFloat = 8
//        
//        let totalSpacing = (2 * 0) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
//        
//        if let collection = self.roomNumberCollectionView {
//            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//            
//            return CGSize(width: width, height: 34)
//            
//        } else {
//            return CGSize(width: 10, height: 10)
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
