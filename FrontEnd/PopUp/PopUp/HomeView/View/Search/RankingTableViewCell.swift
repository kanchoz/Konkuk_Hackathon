//
//  RankingTableViewCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/12.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    @IBOutlet var numLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
