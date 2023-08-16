//
//  EntireStoreListTVCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/17.
//

import UIKit

class EntireStoreListTVCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    
    @IBOutlet var category: UILabel!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var location: UILabel!
    
    @IBOutlet var duration: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 테이블 뷰 셀 사이의 간격
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0))
    }

}
