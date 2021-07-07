//
//  Tabbar.swift
//  Foodie
//
//  Created by Ahliddin on 7/5/21.
//

import UIKit

class Tabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = DeliciousFoodVC(nibName: "DeliciousFoodVC", bundle: nil)
        vc1.tabBarItem.image = UIImage(named: "Vector-1")
        vc1.tabBarItem.badgeColor = .red
        self.tabBar.tintColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        

        
        let vc2 = SecondVC(nibName: "SecondVC", bundle: nil)
        vc2.tabBarItem.image = UIImage(named: "like")
        vc2.tabBarItem.badgeColor = .red
//
//        let vc3 = DeliciousFoodVC(nibName: "DeliciousFoodVC", bundle: nil)
//        vc1.tabBarItem.image = UIImage(named: "istory")
//        vc1.tabBarItem.badgeColor = .red
//
//        let vc4 = SecondVC(nibName: "SecondVC", bundle: nil)
//        vc2.tabBarItem.image = UIImage(named: "like")
//        vc2.tabBarItem.badgeColor = .red
    
        
        viewControllers = [vc1,vc2]

    }
    

  

}
