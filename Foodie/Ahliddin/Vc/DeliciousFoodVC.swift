//
//  DeliciousFoodVC.swift
//  Foodie
//
//  Created by Ahliddin on 7/4/21.
//

import UIKit

class DeliciousFoodVC: UIViewController {

    
    var a = false
    var index:IndexPath!
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        }
}
    @IBOutlet weak var foodsCollection: UICollectionView!{
        didSet {
            foodsCollection.delegate = self
            foodsCollection.dataSource = self
            foodsCollection.register(UINib(nibName: "FoodsCell", bundle: nil), forCellWithReuseIdentifier: "FoodsCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


 
    @IBAction func btnNavigation(_ sender: Any) {
      
        let vc = SeeMoreVC(nibName: "SeeMoreVC", bundle: nil)
        let nv = UINavigationController(rootViewController: vc)
        nv.modalPresentationStyle = .overFullScreen
        present(nv, animated: true, completion: nil)

    }
    
    
    
    

}



extension DeliciousFoodVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.foodsCollection{
            return 14
        }else{
            return 30
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.foodsCollection{
            let cell = foodsCollection.dequeueReusableCell(withReuseIdentifier: "FoodsCell", for: indexPath) as! FoodsCell
            if indexPath.row == 0 && !a{
                cell.viewCell.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
                cell.labelFoods.textColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
            }else {
            if index == indexPath {
                cell.viewCell.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
                cell.labelFoods.textColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
            }else{
                cell.viewCell.backgroundColor = .clear
                cell.labelFoods.textColor = .gray
            }
            }
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell.imageView.layer.cornerRadius = cell.imageView.frame.height/2
            return cell
        }
        
        
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.foodsCollection{
            
            return CGSize(width: 87, height: 56)
        }else{
            return CGSize(width: 220 , height: 321)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath
        a = true
        
    }
    
}

