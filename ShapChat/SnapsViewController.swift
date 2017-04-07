//
//  SnapsViewController.swift
//  ShapChat
//
//  Created by Faisal Alkhotaifi on 4/5/17.
//  Copyright © 2017 Faisal Alkhotaifi. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignOutButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
