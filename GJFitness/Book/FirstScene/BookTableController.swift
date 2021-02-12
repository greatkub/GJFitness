//
//  BookTableController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 6/2/2564 BE.
//

import UIKit

class BookItem {
    var bookImage: UIImage? = nil
    var bookClassName: String = ""
    var bookCalendar: String = ""
    var bookRoomName: String = ""
    var bookTrainerName: String = ""
    var bookStartEnd: String = ""
    
    init(image: UIImage, bookclass: String, calendar: String, room: String, trainer: String, time: String) {
        self.bookImage = image
        self.bookClassName = bookclass
        self.bookCalendar = calendar
        self.bookRoomName = room
        self.bookTrainerName = trainer
        self.bookStartEnd = time
    }
   
}

class BookTableController: UITableViewController {
    
    @IBOutlet var MyBookTable: UITableView!
    
    var selectedClasses = ""
    var items:[BookItem] = []

    var arrayClasses = ["Weight-training", "Boxing", "Yoga"]
    var calendarDisplay = "3 January 2021"
    var arrayRoomName = ["Room1", "Room5", "Room2"]
    var trainerDisplay = ["Krittamet Ch.", "Sanpawat S.", "Cleo P."]
    var timeDisplay = ["10:00 - 11:00", "12:00 - 13:00", "14:00 - 15:00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...arrayClasses.count-1 {
            items.append(BookItem(image:  UIImage(imageLiteralResourceName: arrayClasses[i]), bookclass:arrayClasses[i], calendar: calendarDisplay, room: arrayRoomName[i], trainer: trainerDisplay[i], time: timeDisplay[i]))


        }
     
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookViewCell


        cell.bookImageView.image = items[index].bookImage
        cell.bookClassName.text = items[index].bookClassName
        cell.bookCalendar.text = items[index].bookCalendar
        cell.bookRoomName.text = items[index].bookRoomName
        cell.bookTrainerName.text = items[index].bookTrainerName
        cell.bookStartEnd.text = items[index].bookStartEnd
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
        

        let vc = self.storyboard?.instantiateViewController(identifier: "ticketDisplay") as! TicketViewController
//
        vc.myString = arrayClasses[indexPath.item]
        vc.myCalen = calendarDisplay
        vc.myRoomName = arrayRoomName[indexPath.item]
        self.present(vc, animated: true, completion: nil)
            print("You selected row #\(arrayClasses[indexPath.item])!")
        }


}
    
  

