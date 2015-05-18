//
//  PhotosViewController.swift
//  Exercise#1
//
//  Created by Omar Basrawi on 4/23/15.
//  Copyright (c) 2015 Omar Basrawi. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var refreshControl: UIRefreshControl!
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.insertSubview(self.refreshControl, atIndex: 0)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        onRefresh()
            
            self.tableView.rowHeight = 320;
            
        // Do any additional setup after loading the view.
    }
    
    func onRefresh() {
        // Put your own clientID
        var clientID = ""
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientID)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
            self.photos = responseDictionary["data"] as? [NSDictionary]
            self.tableView.reloadData()
            
            self.refreshControl.endRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let photos = photos {
        
            return photos.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotosTableViewCell
        
        let photo = photos![indexPath.row]
        
        let url = NSURL(string: photo.valueForKeyPath("images.low_resolution.url") as! String)!
        
        cell.photoImageView.setImageWithURL(url)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var indexPath = tableView.indexPathForCell(sender as! PhotosTableViewCell)!
        
        var viewController = segue.destinationViewController as! PhotoDetailsViewController
        
        
        let photo = photos![indexPath.row]
        
        viewController.photo = photo
        //viewController.pictureView = cell.photoImageView
        
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
