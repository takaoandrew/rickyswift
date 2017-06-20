//
//  LoginViewController.swift
//  RolodexSwift
//
//  Created by Andrew Takao on 6/20/17.
//  Copyright © 2017 Andrew Takao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var rolodexImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginPressed(_ sender: Any) {
        print("Login")
    }
}
