//
//  StoredTableViewCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/14.
//

import UIKit

class StoredTableViewCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var category: UILabel!
    @IBOutlet var storeName: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var date: UILabel!
    
    weak var delegate: DeleteBtnDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteBtnTapped(_ sender: UIButton){
        delegate?.deleteBtnTapped(cell: self)
    }

}
