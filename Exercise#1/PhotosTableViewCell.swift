//
//  PhotosTableViewCell.swift
//  Exercise#1
//
//  Created by Omar Basrawi on 4/23/15.
//  Copyright (c) 2015 Omar Basrawi. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var detailPhotoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
