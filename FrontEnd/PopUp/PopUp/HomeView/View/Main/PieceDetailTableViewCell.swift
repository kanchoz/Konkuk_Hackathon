//
//  PieceDetailTableViewCell.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/13.
//

import UIKit

class PieceDetailTableViewCell: UITableViewCell {

    @IBOutlet var pieceImg: UIImageView!
    
    @IBOutlet var SNSLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    @IBOutlet var popupLabel: UILabel!
    @IBOutlet var visitLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
