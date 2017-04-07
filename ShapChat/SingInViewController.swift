//
//  SingInViewController.swift
//  ShapChat
//
//  Created by Faisal Alkhotaifi on 4/5/17.
//  Copyright © 2017 Faisal Alkhotaifi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SingInViewController: UIViewController {
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TurnUpButton(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: EmailTextField.text!, password: PasswordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("We have an error: \(error)")
                
                FIRAuth.auth()?.createUser(withEmail: self.EmailTextField.text!, password: self.PasswordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("We have an error: \(error)")
                    }else {
                        print("Create user successfully")
                        self.performSegue(withIdentifier: "singinSegue", sender: nil)
                    }
                    
                })
                
            }else {
                print("Signed in successfully")
                self.performSegue(withIdentifier: "singinSegue", sender: nil)
            }
        })
    }

}

