//
//  TimeScheduleViewController.swift
//  GJFitness
//
//  Created by James S on 13/2/2564 BE.
//

import UIKit

class RoomCellItem {
    var roomName: String = ""
    var roomTrainer: String = ""
    
    init(roomName: String, trainerName: String){
        self.roomName = roomName
        self.roomTrainer = trainerName
    }
}

class TimeScheduleViewController: UIViewController {
    
    @IBOutlet weak var timeSlotTable: UITableView!
    
    @IBOutlet weak var classImageViewInfo: UIImageView!
    @IBOutlet weak var classNameInfo: UILabel!
    
    @IBOutlet var date: UILabel!
    @IBOutlet var timeslot: UILabel!
    @IBOutlet var members: UILabel!
    
    var classNameLabel = ""
    var classImage = UIImage()
    
    var myDate = String()
    var myMember = String()
    var timeLimit = String()
    var selected = Int()
    
    var rooms: [RoomCellItem] = []
    var roomNumber = ["Room1", "Room2", "Room3"]
    var trainers = ["Krittamet Ch.", "Sanpawat S.", "Cleo P."]
    var time2d = [[ "15" , "16"], ["17", "18", "19" , "20"],["21", "22", "23"]]
    var time3d = [[[ "10:00" , "12:00"], ["13:00", "14:00", "15:00" , "16:00"],["17:00", "18:00", "19:00"]],
                  [[ "10:00" , "11:00"], ["12:00", "13:00", "14:00:00" , "15:00"],["13:00", "14:00", "15:00"]],
                  [[ "19:00" , "20:00"], ["11:00", "12:00", "13:00" , "14:00"],["15:00", "16:00", "17:00"]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classImageViewInfo.image = classImage
        classNameInfo.text = classNameLabel
        
        for i in 0...roomNumber.count-1 {
            rooms.append(RoomCellItem(roomName: roomNumber[i], trainerName: trainers[i]))
        }
    }
    
    @IBAction func BackToClassList(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension TimeScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "room_cell", for: indexPath) as! RoomCell
        
        cell.timeslotsList = time3d[selected][index]
        cell.roomNumber.text = rooms[index].roomName
        cell.trainerName.text = rooms[index].roomTrainer
        
        return cell
    }
    
    
}
