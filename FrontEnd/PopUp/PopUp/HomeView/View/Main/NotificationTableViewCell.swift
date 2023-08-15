//
//  NotificationTableViewCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/16.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
