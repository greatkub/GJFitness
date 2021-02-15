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
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    var myString = String()
    var myCalen = String()
    var timeLimit = String()
    var member = String()
    var selected = Int()
    
    var items: [RoomItem] = []

    var room = ["Room1", "Room5", "Room2"]
    var trainer = ["Krittamet Ch.", "Sanpawat S.", "Cleo P."]
    var timeDisplay2d = [[ "15" , "16"], ["17", "18", "19" , "20"],["21", "22", "23"]]
    
    var timeDisplay3d = [[[ "10:00" , "12:00"], ["13:00", "14:00", "15:00" , "16:00"],["17:00", "18:00", "19:00"]],
                         [[ "10:00" , "11:00"], ["12:00", "13:00", "14:00:00" , "15:00"],["13:00", "14:00", "15:00"]],
                         [[ "19:00" , "20:00"], ["11:00", "12:00", "13:00" , "14:00"],["15:00", "16:00", "17:00"]]]
    
    
    var timeDisplayColor = [[[.systemGreen ,.systemGreen], [.systemGreen, .systemGreen, .systemGreen , .systemGreen],[.systemGreen, .systemGreen, .systemGreen]],
                            [[ .systemGreen , .systemGreen], [.systemGreen, .systemGreen, .systemGreen , .systemGreen],[.systemGreen, .systemGreen, .systemGreen]],
                            [[ .systemGreen , .systemGreen], [.systemGreen,.systemGreen, .systemGreen , UIColor.green],[.systemGreen, .systemGreen, .systemGreen]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        classImage.image = UIImage(named: myString)
        className.text = myString
        calendar.text = myCalen
        time.text = timeLimit
        numOfmember.text = member
        
        classImage.layer.cornerRadius = 10
        classImage.contentMode = .scaleAspectFill
        
        for i in 0...room.count-1 {
            items.append(RoomItem(room: room[i], trainer: trainer[i]))
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(cellRoomClicked(notification:)), name: .roomCellClicked, object: nil)
    }
    
    @objc func cellRoomClicked(notification: NSNotification) {
        if let data = notification.object as? String {
            let alert = UIAlertController(title: "Are you confirm to book?", message: "\(data)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                
                
                print("ok")
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
//    @objc func bookSuccess(notification: NSNotification) {
//        if let data = notification.object as? String {
//            let alert = UIAlertController(title: "Book successfully", message: "\(data)", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
//
//                print("done")
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
    
    
    
    

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
//    func showAlert(title: String, message: String){
//        let alert = UIAlertController(title: "Invalid Credentials", message: "Incorrect username or password", preferredStyle: .alert)
//        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//        alert.addAction(alertAction)
//        self.present(alert, animated: true, completion: nil)
//    }


    

}



