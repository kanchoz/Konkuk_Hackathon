//
//  SearchTableViewCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/17.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var category: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var duration: UILabel!
    
    var data: StoreSimple?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
