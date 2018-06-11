//
//  SignUpViewController.swift
//  Black_Euro
//
//  Created by Stanislav Cherkasov on 14.05.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attributedTextField(textField: userNameTextField)
        attributedTextField(textField: emailTextField)
        attributedTextField(textField: passTextField)
    }

    @IBAction func dismissOnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func attributedTextField(textField: UITextField) -> UITextField {
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        return textField
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passTextField.text!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let user = user {
                print("Sign Up Successfully. \(user.additionalUserInfo)")
            }
        }
}
}
