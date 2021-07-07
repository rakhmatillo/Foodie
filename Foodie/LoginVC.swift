//
//  LoginVC.swift
//  figma_food_delivery_app
//
//  Created by Zokirov Firdavs on 04/07/21.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var stc: UIStackView!
    @IBOutlet weak var stc2: UIStackView!
    @IBOutlet weak var forgotPasscode: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var dataTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var datePicker = UIDatePicker()
    var isPressed: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        dataTF.inputView = datePicker
        datePicker.addTarget(self, action: #selector(pickerDateChengedValue), for: .valueChanged)
        
        setupRadius()
        toolbar()
    }
    
    @objc func pickerDateChengedValue() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY , HH:mm"
        dataTF.text = dateFormatter.string(from: datePicker.date)
        
    }
    func toolbar() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        toolbar.isTranslucent = true
        let selectedBtn = UIBarButtonItem(title: "Select", style: .done, target: self, action: #selector(selectBtnPressed))
        let spaceBtn =  UIBarButtonItem(systemItem: .flexibleSpace)
        selectedBtn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        dataTF.inputAccessoryView = toolbar
        toolbar.items = [spaceBtn,selectedBtn]
    }
    
    
    func setupRadius(){
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2
        
        loginView.layer.cornerRadius = loginView.frame.height/5
        loginView.backgroundColor = .white
        loginView.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        loginView.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginView.layer.shadowRadius = 3
        loginView.layer.shadowOpacity = 0.5
        stc2.isHidden = true
    }
    
    
    
    
    
    @IBAction func loginPressed(_ sender: Any) {
        isPressed = true
        if isPressed{
            forgotPasscode.isHidden = false
            stc.isHidden = false
            stc2.isHidden = true
            UIView.animate(withDuration: 0.3) { [self] in
                self.animationView.transform = .identity
                isPressed = false
            }
        }
    }
    
    
    
    @IBAction func signUpPressed(_ sender: Any) {
        isPressed = false
        
        if !isPressed{
            forgotPasscode.isHidden = true
            stc.isHidden = true
            stc2.isHidden = false
            UIView.animate(withDuration: 0.3) { [self] in
                self.animationView.transform = CGAffineTransform(translationX: 190, y: 0)
                isPressed = true
            }
        }
    }
    @objc func selectBtnPressed() {
        if passwordTF.isFirstResponder {
            passwordTF.resignFirstResponder()
            dataTF.becomeFirstResponder()
        } else {
            dataTF.resignFirstResponder()
        }
    }

    
    
}
extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
