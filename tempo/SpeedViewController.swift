//
//  SpeedViewController.swift
//  tempo
//
//  Created by Quinn Quintero on 7/13/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController {
    var userSpeed = ""
    @IBOutlet weak var mphTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mphTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func curatePlaylistButtonPressed(_ sender: UIButton) {
        //when user presses curate playlist
        self.userSpeed = mphTextField.text!
        //user AF to create playlist here
        //move to new view controller informing the user that their playlist has been created
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mphTextField.resignFirstResponder()
    }
}


extension SpeedViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            mphTextField.resignFirstResponder()
        return true
    }
}
