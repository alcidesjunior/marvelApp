//
//  HeroeTableViewCell.swift
//  MarvelApp
//
//  Created by Ada 2018 on 8/23/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class HeroeTableViewCell: UITableViewCell {

    @IBOutlet weak var heroeName: UILabel!
    @IBOutlet weak var heroeImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
