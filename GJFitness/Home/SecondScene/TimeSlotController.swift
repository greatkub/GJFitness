//
//  TimeSlotController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 8/2/2564 BE.
//

import UIKit

class RoomItem {
    var roomName:  String = ""
    var roomTrainer: String = ""
   
    
    init(room: String, trainer: String) {
        self.roomName = room
        self.roomTrainer = trainer
      
    }
   
}
class TimeSlotController: UIViewController {

    @IBOutlet weak var mySlotTable: UITableView!
    
    @IBOutlet var classImage: UIImageView!
    @IBOutlet var className: UILabel!
    @IBOutlet var calendar: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var numOfmember: UILabel!
    
    var myString = String()
    var myCalen = String()
    var timeLimit = String()
    var member = String()
    var selected = Int()
    
    var items: [RoomItem] = []

    var room = ["Room1", "Room5", "Room2"]
    var trainer = ["Krittamet Ch.", "Sanpawat S.", "Cleo P."]
    var timeDisplay2d = [[ "15" , "16"], ["17", "18", "19" , "20"],["21", "22", "23"]]
    
    var timeDisplay3d = [[[ "1" , "2"], ["3", "4", "5" , "6"],["7", "8", "9"]],
                         [[ "10" , "11"], ["12", "13", "14" , "15"],["16", "17", "18"]],
                         [[ "19" , "20"], ["21", "22", "23" , "24"],["25", "26", "27"]]]
    
    
    var timeDisplayColor = [[[UIColor.green , UIColor.green], [UIColor.green, UIColor.green, UIColor.green , UIColor.green],[UIColor.green, UIColor.green, UIColor.green]],
                            [[ UIColor.green , UIColor.green], [UIColor.green, UIColor.green, UIColor.green , UIColor.green],[UIColor.green, UIColor.green, UIColor.green]],
                            [[ UIColor.green , UIColor.green], [UIColor.green, UIColor.green, UIColor.green , UIColor.green],[UIColor.green, UIColor.green, UIColor.green]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        classImage.image = UIImage(named: myString)
        className.text = myString
        calendar.text = myCalen
        time.text = timeLimit
        numOfmember.text = member
        
        for i in 0...room.count-1 {
            items.append(RoomItem(room: room[i], trainer: trainer[i]))
        }
        

    }

}
extension TimeSlotController: UITableViewDataSource, UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 20
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomViewCell

       // cell.timeslots = timeDisplay2d[index]
        cell.timeslots = timeDisplay3d[selected][index]
        cell.timeslotsColor = timeDisplayColor[selected][index]
        cell.room.text = items[index].roomName
        cell.trainer.text = items[index].roomTrainer
        
        
//        cell.collecTime
        
        return cell
    }
    
    
    
//    //new add
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let tableViewCell = cell as? RoomViewCell else { return }
//
//        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
//       // tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
//    }


    

}



