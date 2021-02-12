//
//  TimeScheduleViewController.swift
//  GJFitness
//
//  Created by James S on 12/2/2564 BE.
//

import UIKit

class TimeItem {
    var time: UIButton? = nil
    
    init(time: UIButton) {
        self.time = time
    }
}

class TimeScheduleViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var timeButton: UIButton!
    
    var items: [TimeItem] = []
    
    var classNameLabel = ""
    var classImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = classImage
        className.text = classNameLabel
        
    }
    
    @IBAction func BackToClassList(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Back to Collection View")
        }
    }
    
}

extension TimeScheduleViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! TimeCell
        
        cell.timeButton = items[index].time
     
        return cell
    }
    
    
}
