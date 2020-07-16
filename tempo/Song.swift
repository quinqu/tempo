//
//  Song.swift
//  tempo
//
//  Created by Quinn Quintero on 7/16/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import Foundation

struct Song: Codable {
    var name:String = "" //["name"]
    var artists: [Artists]
    var album: Album
    
    //String = "" //["artists"]["name"] image: ["images"][0]["url"]
    
}
