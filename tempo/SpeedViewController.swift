//
//  SpeedViewController.swift
//  tempo
//
//  Created by Quinn Quintero on 7/13/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import UIKit
import Alamofire


class SpeedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var userSpeed = ""
    var userHeight = -1
    var index = -1
    var userId = ""
    var pickerData = ["miles/hour", "kilometers/hour", "minutes/mile"]
    var metrics = ["mph", "kph", "mpm"]
    
    @IBOutlet weak var speedLabel: UILabel!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickerData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        index = row
        speedLabel!.text = "\(pickerData[row])"
        print(index)
    }
    


    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var mphTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mphTextField.delegate = self
        picker!.delegate = self
        picker!.dataSource = self
    }
    
    
    @IBAction func curatePlaylistButtonPressed(_ sender: UIButton) {
        //when user presses curate playlist
        self.userSpeed = mphTextField.text!        
        
        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            userId = sceneDelegate.spotifyUserId
        }
        // TODO: if statment here for metrics
       // let queryUrl = URL(string: "https://tempo-app-api.herokuapp.com/playlist/\(userId)?mph=\(userSpeed)&height=\(userHeight)")
        print(metrics[index])
          let queryUrl = URL(string: "https://tempo-app-api/playlist/\(userId)?metric=\(metrics[index])&speed=\(userSpeed)&height=\(userHeight)")
        
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
