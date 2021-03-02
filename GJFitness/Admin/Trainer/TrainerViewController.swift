//
//  TrainerViewController.swift
//  GJFitness
//
//  Created by James S on 23/2/2564 BE.
//

import UIKit

class TrainerItem {
    var trainerName: String = ""
    var trainerPhone: String = ""
    
    init(trainerName: String, trainerPhone: String) {
        self.trainerName = trainerName
        self.trainerPhone = trainerPhone
    }
}

class TrainerViewController: UIViewController {
    var tableData = [
        (title:"Krittamet Ch", subtitle: "092-315-2166"),
        (title:"James", subtitle: "035-123-333"),
        (title:"Yong", subtitle: "085-084-8110"),
        (title:"Tiew", subtitle: "095-772-3363")
    ]
    
    var items:[TrainerItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...tableData.count-1 {
            items.append(TrainerItem(trainerName: tableData[i].title, trainerPhone: tableData[i].subtitle))
            
        }
        
    }
    
    @IBAction func addTrainer(_ sender: Any) {
        promptForAnswer()
    }
    
    private func promptForAnswer() {
        let ac = UIAlertController(title: "Enter trainer name and phone numeber", message: nil, preferredStyle: .alert)
        
        ac.addTextField { (textField) in
            textField.placeholder = "Trainer name"
        }
        
        ac.addTextField { (textField) in
            textField.placeholder = "Phone number"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action:UIAlertAction) in
            
            let tfTrainerName = ac.textFields![0] as UITextField;
            UserDefaults.standard.set(tfTrainerName.text, forKey: "Trainer_name")
            
            let tfTrainerPhone = ac.textFields![1] as UITextField
            UserDefaults.standard.set(tfTrainerPhone.text, forKey: "Phone_number")
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(addAction)
        ac.addAction(cancelAction)
        present(ac, animated: true)
    }
    
    private func callNumber(phoneNumber: String) {
      if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    
}

extension TrainerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "trainer_cell")!
        
        cell.textLabel?.text = tableData[index].title
        cell.detailTextLabel?.text = tableData[index].subtitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        callNumber(phoneNumber: tableData[indexPath.row].subtitle)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
}