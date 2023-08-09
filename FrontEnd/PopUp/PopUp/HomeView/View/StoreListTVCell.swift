//
//  StoreListTVCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/09.
//

import UIKit
// MARK: - 카테고리별 tableViewcell들이 나타남.
class StoreListTVCell: UITableViewCell {

    @IBOutlet var storeImg: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
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
