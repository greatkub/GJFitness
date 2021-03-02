//
//  ClassListViewController.swift
//  GJFitness
//
//  Created by James S on 9/2/2564 BE.

import UIKit

class ClassListItem {
    var classImage: UIImage? = nil
    var className: String = ""
    
    init(image: UIImage, name: String) {
        self.classImage = image
        self.className = name
    }
}

class ClassListViewController: UIViewController {
    @IBOutlet var classCollectionView: UICollectionView!
    @IBOutlet weak var createClass: UIButton!
    
    var arrayClasses = ["Weight-training", "Boxing", "Yoga", "Weight-training", "Boxing", "Yoga", "Weight-training", "Boxing", "Yoga", "Weight-training", "Boxing", "Yoga"]
    
    var items: [ClassListItem] = []
    
    @IBAction func CreateClass(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Admin", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CreateClassViewController") as? CreateClassViewController
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...arrayClasses.count-1 {
            items.append(ClassListItem(image: UIImage(imageLiteralResourceName: "\(arrayClasses[i])"), name: "\(arrayClasses[i])"))
            
        }
    }
    
    @IBAction func deleteAll(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete All", message: "Do you confirm deleting all classes?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in
            self.items.removeAll()
            self.classCollectionView.reloadData()
        
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ClassListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "class_list_cell", for: indexPath) as! ClassListCell
        cell.classImageView.image = items[index].classImage
        cell.className.text = items[index].className
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 8
        
        let totalSpacing = (2 * 10) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.classCollectionView {
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width + 65)
        } else{
            return CGSize(width: 124, height: 171)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item at \(indexPath.section)/\(indexPath.item) tapped")
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Admin", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "TimeScheduleViewController") as? TimeScheduleViewController
        
        vc?.classNameLabel = items[indexPath.row].className
        vc?.classImage = items[indexPath.row].classImage!
        self.present(vc!, animated: true, completion: nil)
        
    }
    
}