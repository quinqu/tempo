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
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}

extension PlaylistMadeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row].name
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.text = songs[indexPath.row].artists[0].name
        cell.textLabel?.textColor = UIColor.white
        let imageURL = URL(string: songs[indexPath.row].album.images[0].url)
        cell.imageView?.kf.setImage(with: imageURL) { result in
            cell.setNeedsLayout() //invalidate current layout
            cell.layoutIfNeeded() //update immediately
          switch result {
          case .success(let value):
              print("Image: \(value.image). Got from: \(value.cacheType)")
          case .failure(let error):
              print("Error: \(error)")
          }
        }
//        ge(with: imageURL, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, URL) in
//            cell.setNeedsLayout()
//        })
//
   
        //cell.imageView?.kf.setImage(with: imageURL)
  

        return cell
    }
}
