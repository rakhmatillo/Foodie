//
//  LoginVC.swift
//  figma_food_delivery_app
//
//  Created by Zokirov Firdavs on 04/07/21.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var loginTagView: UIView!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    var isPressed : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRadius()
    }
    
    func setupRadius(){
        
        loginView.backgroundColor = .white
        loginView.layer.cornerRadius = 30
        loginView.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        loginView.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginView.layer.shadowRadius = 3
        loginView.layer.shadowOpacity = 0.5
        
        
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2
        loginTagView.backgroundColor = .systemOrange

//        passwordTF.addAction(.supportsSecureCoding, for: <#T##UIControl.Event#>)
        
        
         
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        loginTagView.backgroundColor = .systemOrange
        isPressed = true
        if isPressed{
            UIView.animate(withDuration: 0.3) { [self] in
          self.loginTagView.transform = .identity
            isPressed = false
         }
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        isPressed = false
        if !isPressed{
            UIView.animate(withDuration: 0.3) { [self] in
            self.loginTagView.transform = CGAffineTransform(translationX: 190, y: 0)
            isPressed = true
         }
      }
        
    }
      @IBAction func loginBtnPressed(_ sender: Any)  {
        if ((emailTF.text?.isValidEmail()) != nil){
            
        }
       
    }
    
}


extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
