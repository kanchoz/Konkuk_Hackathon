//
//  PieceTableViewCell.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/12.
//

import UIKit

class PieceTableViewCell: UITableViewCell {

    @IBOutlet var pieceImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
