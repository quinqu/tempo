//
//  LoginViewController.swift
//  tempo
//
//  Created by Quinn Quintero on 7/14/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import SafariServices
import UIKit

class LoginViewController: UIViewController, SFSafariViewControllerDelegate{

    override func viewDidLoad() {
        let vc = SFSafariViewController(url: URL(string: "http://localhost:3000/auth/spotify")!)
        present(vc, animated: true)
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
