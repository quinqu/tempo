//
//  ViewController.swift
//  tempo
//
//  Created by Quinn Quintero on 7/13/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          
      }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("here")
//        let vc = SFSafariViewController(url: URL(string: "http://localhost:3000/auth/spotify")!)
//        present(vc, animated: true)
//
//        vc.loadViewIfNeeded()
        

//        //if statement
//        vc.navigationController?.popViewController(animated: true)
//        vc.dismiss(animated: true, completion: nil)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "height_vc") as! HeightViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    
    
}

