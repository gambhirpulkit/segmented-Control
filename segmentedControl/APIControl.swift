//
//  APIControl.swift
//  segmentedControl
//
//  Created by Dignitas Digital on 7/1/15.
//  Copyright (c) 2015 Dignitas Digital. All rights reserved.
//

import Foundation

//
//  TestAPI.swift
//  jsonParseArre
//
//  Created by Dignitas Digital on 6/23/15.
//  Copyright (c) 2015 Dignitas Digital. All rights reserved.
//

import Foundation

class APIControl {
    
    func loadShots(shotsUrl: String, completion: (([MovieData]) -> Void)!) {
        
        let accessToken = "dc5a71673c52e02fb510a7bf514789a90c1d9c169c13edbd92e5e19ba74a5f56"
        //  var urlString = shotsUrl + "?access_token=" + accessToken + "&page=1&per_page=25"
        var urlString = shotsUrl
        
        println("NSURLSession: \(urlString)")
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(shotsUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                
                println(error.description)
                println(error.localizedDescription)
            } else {
                
                var error : NSError?
                
                println("Begin Serialization: ")
                println(data.length)
                
                
                var shotsDataArray = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as! NSDictionary
                
                var NewsDictionary = (shotsDataArray.valueForKey("trailers")) as! NSArray
                
                //  println(shotsDataArray)
                
                var shots = [MovieData]()
                println(NewsDictionary.count)
                
                
                for shot in NewsDictionary{
                    
                    
                    
                    //  let shot = NewsData(NewsDictionary. : shot as NSDictionary)
                    //   let shot = NewsData(shot)
                    //   var title =  shotsDataArray["items"]!["title"] as String
                    //    var date = shotsDataArray["items"]!["date"] as String
                    //   var url = shotsDataArray["items"]!["url"] as String
                    // var shot: NewsData;()
                    
                    let shot = MovieData(data:shot as! NSDictionary )
                    
                    
                    //  shot.title = title
                    // shot.url = url
                    // shot.date = date
                    
                    //   println(shotsDataArray["title"])
                    
                    //println(shot.title)
                    
                    shots.append(shot as MovieData)
                    
                    // println("Appending Data :")
                    
                }
                
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(shots)
                    }
                }
                
            }
        }
        
        task.resume()
    }
    
    
    
}