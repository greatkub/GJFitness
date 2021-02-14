//
//  TicketViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 8/2/2564 BE.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet var ticketImage: UIImageView!
    @IBOutlet var ticketClassName: UILabel!
    @IBOutlet var ticketCalendar: UILabel!
    @IBOutlet var ticketRoomName: UILabel!
    var myString = String()
    var myCalen = String()
    var myRoomName = String()

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
//    var room = ["Room 1", "Room2", "Room3"]
//    var trainer = ["Krittamet Ch.", "Cleo Powell", "Saharat T."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ticketImage.image = UIImage(named: myString)
        ticketClassName.text = myString
        ticketCalendar.text = myCalen
        ticketRoomName.text = myRoomName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
