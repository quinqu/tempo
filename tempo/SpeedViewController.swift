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
    var userId = ""
 
    @IBOutlet weak var mphTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mphTextField.delegate = self
    }
    
    
    @IBAction func curatePlaylistButtonPressed(_ sender: UIButton) {
        //when user presses curate playlist
        self.userSpeed = mphTextField.text!
        //user AF to create playlist here
        
        
        //move to new view controller informing the user that their playlist has been created

        
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            userId = sceneDelegate.spotifyUserId
        }
        
        let queryUrl = URL(string: "https://tempo-app-api.herokuapp.com/playlist/\(userId)?mph=\(userSpeed)&height=\(userHeight)")
        
        guard queryUrl != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: queryUrl!) { [weak self] (data, response, error) in
            
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let songs = try decoder.decode([Song].self, from: data!)
                
                     DispatchQueue.main.async {
                        self?.navigateToPlaylistMade(songs)
                     }
               
                    
                }catch {
                    print("data does not exist")
                }
            }
        }
        dataTask.resume() //api call
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mphTextField.resignFirstResponder()
    }
    
    func navigateToPlaylistMade(_ songs : [Song]) {
        //move to new view controller informing the user that their playlist has been created
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "playlistMade_vc") as! PlaylistMadeViewController
        nextViewController.songs = songs
        present(nextViewController, animated:true, completion:nil)

    }
}





extension SpeedViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mphTextField.resignFirstResponder()
        return true
    }
}
