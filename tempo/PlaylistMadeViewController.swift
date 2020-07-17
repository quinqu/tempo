//
//  PlaylistMadeViewController.swift
//  tempo
//
//  Created by Quinn Quintero on 7/14/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import UIKit
import Kingfisher


class PlaylistMadeViewController: UIViewController {
    var songs = [Song]()
    @IBOutlet var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}

extension PlaylistMadeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("idk")
    }
}
extension PlaylistMadeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row].name
        cell.detailTextLabel?.text = songs[indexPath.row].artists[0].name
        
        let imageURL = URL(string: songs[indexPath.row].album.images[0].url)
        cell.imageView?.kf.setImage(with: imageURL) 
  

        return cell
    }
}
