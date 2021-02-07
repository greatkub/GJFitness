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
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            // handle tap events
//        selectedPlanet = arrayPlanets[indexPath.item]
//        print(selectedPlanet)
//        let vc = self.storyboard?.instantiateViewController(identifier: "PlanetDisplay") as! PlanetViewController
//        vc.myString = selectedPlanet
//        self.present(vc, animated: true, completion: nil)
//            print("You selected cell #\(arrayPlanets[indexPath.item])!")
//        }
    
    
}




