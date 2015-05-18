//
//  PhotoDetailsViewController.swift
//  Exercise#1
//
//  Created by Omar Basrawi on 4/23/15.
//  Copyright (c) 2015 Omar Basrawi. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var photo: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.rowHeight = 320;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("PhotoDetailCell") as! PhotosTableViewCell
    
        let url = NSURL(string: photo.valueForKeyPath("images.standard_resolution.url") as! String)!

        cell.detailPhotoView.setImageWithURL(url)
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
