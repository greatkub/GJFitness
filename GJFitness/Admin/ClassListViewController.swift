//
//  ClassListViewController.swift
//  GJFitness
//
//  Created by James S on 9/2/2564 BE.
//

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
    
    var items: [ClassItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.append(ClassItem(image: #imageLiteral(resourceName: "Boxing"), name: "Earth"))
        items.append(ClassItem(image: #imageLiteral(resourceName: "Weight-training"), name: "Test"))
        items.append(ClassItem(image: #imageLiteral(resourceName: "Boxing"), name: "Earth"))
        items.append(ClassItem(image: #imageLiteral(resourceName: "Weight-training"), name: "Test"))
    }
}

extension ClassListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
}
