//
//  Menu.swift
//  Foodie
//
//  Created by Oybek Iskandarov on 7/4/21.
//

import UIKit

class Menu: UIViewController {
    @IBOutlet weak var bigBackgroundView: UIView!
    @IBOutlet weak var buttonDismis: UIButton!
    var menuDismisButton : UIButton {
       let b = UIButton()
        b.backgroundColor = .red
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.981633842, green: 0.2908881307, blue: 0.04805722088, alpha: 1)
        // Do any additional setup after loading the view.
    }
    @IBAction func menuButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.bigBackgroundView.transform = CGAffineTransform(translationX: self.view.frame.width / 1.5, y: 0).scaledBy(x: 0.75, y: 0.75)
            self.buttonDismis.transform = CGAffineTransform(translationX: -455, y: 0)
            self.bigBackgroundView.layer.cornerRadius = 30
        }
    }
    @IBAction func menuDismisButton(_ sender: Any) {
        
            UIView.animate(withDuration: 1) {
                self.bigBackgroundView.transform = CGAffineTransform(translationX: 0, y: 0).scaledBy(x: 1, y: 1)
                self.buttonDismis.transform = CGAffineTransform(translationX: 310, y: 0)
                self.bigBackgroundView.layer.cornerRadius = 0
            }
    }
    



}
