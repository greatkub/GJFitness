//
//  CreateClassViewController.swift
//  GJFitness
//
//  Created by James S on 11/2/2564 BE.
//

import UIKit

class RoomNumberItem {
    var roomNumber: String = ""
    
    init(roomNumber: String) {
        self.roomNumber = roomNumber
    }
}

class TimeItem {
    var timeslot: String = ""
    
    init(timeslot: String) {
        self.timeslot = timeslot
    }
}

class CreateClassViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var doneCreateButton: UIButton!
    @IBOutlet weak var imageAcces: UIImageView!
    
    @IBOutlet weak var tfDatePicker: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet var roomNumberCollectionView: UICollectionView!
    @IBOutlet var roomTimeSlot:UICollectionView!
    
    var roomNumberItems: [RoomNumberItem] = []
    var roomTimeSlots: [TimeItem] = []
    
    var roomNumbers = ["1", "2", "3", "4"]
    var roomTimeSlotList = ["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"]
    
    var count = 0
    var count2 = 0
//These one use for switch color while tap two times.
    override func viewDidLoad() {
        super.viewDidLoad()
        doneCreateButton.layer.cornerRadius = 15
        imageAcces.layer.cornerRadius = 12
        
        showDatePicker()
        
        roomNumberCollectionView.tag = 1
        roomTimeSlot.tag = 2
        
        for i in 0...roomNumbers.count-1 {
            roomNumberItems.append(RoomNumberItem(roomNumber: roomNumbers[i]))
        }
        
        for i in 0...roomTimeSlotList.count-1 {
            roomTimeSlots.append(TimeItem(timeslot: roomTimeSlotList[i]))
        }
    }
    
    @IBAction func BackToClassList(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Back to class list screen")
        }
    }
    
    @IBAction func changePhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion:  nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        
        imageAcces.clipsToBounds = true
        imageAcces.contentMode = .scaleAspectFill
        imageAcces.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func showDatePicker() {
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.sizeToFit()
        }
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: true)
        
        tfDatePicker.inputAccessoryView = toolbar
        tfDatePicker.inputView = datePicker
        
    }
    
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        tfDatePicker.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
}

extension CreateClassViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return roomNumberItems.count
            
        default:
            return roomTimeSlots.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        switch collectionView.tag {
        case 1:
            let roomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "room_number_cell", for: indexPath) as! RoomNumberCell
            roomCell.roomNumber.text = roomNumberItems[index].roomNumber
            
            return roomCell
            
        default:
            let timeSlotCell = collectionView.dequeueReusableCell(withReuseIdentifier: "room_time_slot", for: indexPath) as! RoomTimeSlotCell
            timeSlotCell.roomTimeSlot.text = roomTimeSlots[index].timeslot
            
            return timeSlotCell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("HEEER item at \(indexPath.section)/\(indexPath.item) tapped")
        switch collectionView.tag {
        case 1:
            let cell = collectionView.cellForItem(at: indexPath) as? RoomNumberCell
            if count == 0 {
                count = count + 1
                cell?.contentView.backgroundColor = .systemYellow
                
            } else {
                count = 0
                cell?.contentView.backgroundColor = .systemGray3
                
            }
            
        default:
            let cell = collectionView.cellForItem(at: indexPath) as? RoomTimeSlotCell
            if count2 == 0 {
                count2 = count2 + 1
                cell?.contentView.backgroundColor = .systemYellow

            } else {
                count2 = 0
                cell?.contentView.backgroundColor = .systemGray3

            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 4
        let spacingBetweenCells:CGFloat = 8
        
        let totalSpacing = (2 * 0) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.roomNumberCollectionView {
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            
            return CGSize(width: width, height: 34)
            
        } else {
            return CGSize(width: 10, height: 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
