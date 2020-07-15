//
//  SpeedViewController.swift
//  tempo
//
//  Created by Quinn Quintero on 7/13/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import UIKit
import Alamofire


class SpeedViewController: UIViewController {
    var userSpeed = ""
    var userHeight = -1
    
    @IBOutlet weak var mphTextField: UITextField!
    
    override func viewDidLoad() {
        mphTextField.delegate = self
        super.viewDidLoad()
        //mphTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func curatePlaylistButtonPressed(_ sender: UIButton) {
        //when user presses curate playlist
        self.userSpeed = mphTextField.text!
        //user AF to create playlist here
        
        
        //move to new view controller informing the user that their playlist has been created
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "playlistMade_vc") as! PlaylistMadeViewController
        print(userHeight)
        
        
        // get playlist request
        print(userSpeed)
        let queryUrl = "http://localhost:3000/playlist/quinruby?mph=\(userSpeed)&height=\(userHeight)"
        print(queryUrl)
        AF.request(queryUrl).response { response in
            debugPrint(response)
        }
        
        self.present(nextViewController, animated:true, completion:nil)
        
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
