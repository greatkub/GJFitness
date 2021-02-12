//
//  ViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 6/2/2564 BE.
//

import UIKit

class ClassItem {
    var classImage: UIImage? = nil
    var className: String = ""
    
    init(image: UIImage, name: String) {
        self.classImage = image
        self.className = name
    }
}
class ViewController: UIViewController {

    var selectedClass = ""
     var items: [ClassItem] = []
     var arrayClasses = ["Weight-training", "Boxing", "Yoga"]
    
    var calendarDisplay = "3 January 2021"
    var arrayRoomName = ["Room1", "Room5", "Room2"]
    var trainerDisplay = ["Krittamet Ch.", "Sanpawat S.", "Cleo P."]
    var timeDisplay = ["10:00 - 11:00", "12:00 - 13:00", "14:00 - 15:00"]
    var timeLimit = "1 hrs."
    var numGroup = "20 per class"
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0...arrayClasses.count-1 {
            items.append(ClassItem(image: UIImage(imageLiteralResourceName: "\(arrayClasses[i])"), name: "\(arrayClasses[i])"))
        }

//        items.append(ClassItem(image: UIImage(imageLiteralResourceName: "Boxing"), name: "Boxing"))
//
    }
    
   
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classviewcell", for: indexPath) as! ClassViewCell
        
        
        cell.classImageView.image = items[index].classImage
        cell.className.text = items[index].className
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
        let vc = self.storyboard?.instantiateViewController(identifier: "timeSlot") as! TimeSlotController
//
        vc.myString = arrayClasses[indexPath.item]
        vc.myCalen = calendarDisplay
        vc.timeLimit = timeLimit
        vc.member = numGroup
        vc.selected = indexPath.item
        
//        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
            print("You selected row #\(arrayClasses[indexPath.item])!")
        

    
    }
}




