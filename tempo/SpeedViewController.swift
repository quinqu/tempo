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
    //var songs = [Songs]
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
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "playlistMade_vc") as! PlaylistMadeViewController
        
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            userId = sceneDelegate.spotifyUserId
        }
        
        let queryUrl = URL(string: "http://localhost:3000/playlist/\(userId)?mph=\(userSpeed)&height=\(userHeight)")!
        
        URLSession.shared.dataTask(with: queryUrl) { data, _, _ in
            if let data = data {
                    let songs = try? JSONDecoder().decode([Song].self, from: data)
                    print(songs)
            }
        }.resume()
        
        
        
        
        
        
//        AF.request(queryUrl).response { response in
//            //debugPrint(response)
//            guard let data = response.data else { return }
//            //var songs = [Songs].self
//
//
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data) as? [[String: String]] {
//                    print(json)
//                    for song in json {
//                        print(song)
//                        //let s = Songs(title: song["name"]!, artist: song["artists"]["name"] )
//                        //songs.append(s)
//                    }
//                }
//            } catch { print(error) }
//
//
//
//    }
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
