//
//  MakePieceTableViewCell.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/15.
//

import UIKit

class MakePieceTableViewCell: UITableViewCell  {

    @IBOutlet var lineView: UIView!
    @IBOutlet var pieceImg: UIImageView!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cateLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   

}
