//
//  SignInViewController.swift
//  Black_Euro
//
//  Created by Stanislav Cherkasov on 14.05.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var incorrectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        incorrectLabel.isHidden = true
        
        emailTextField.backgroundColor = UIColor.clear
        emailTextField.textColor = UIColor.white
        emailTextField.keyboardType = .emailAddress
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        passTextField.backgroundColor = UIColor.clear
        passTextField.textColor = UIColor.white
        passTextField.keyboardType = .numberPad
        passTextField.isSecureTextEntry = true
        passTextField.attributedPlaceholder = NSAttributedString(string: passTextField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passTextField.text!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "signInGoodSegue", sender: self)
            } else {
                self.incorrectLabel.isHidden = false
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
    }
}
