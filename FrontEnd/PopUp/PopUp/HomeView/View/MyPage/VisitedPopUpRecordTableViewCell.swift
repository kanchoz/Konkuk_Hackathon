//
//  VisitedPopUpRecordTableViewCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/15.
//

import UIKit

class VisitedPopUpRecordTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var category: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var dateLabel2: UILabel!
    
    @IBOutlet var reviewView: UIView! //리뷰 여부에 따라 isHidden 조절
    @IBOutlet var reviewBtn: UIButton! //리뷰 여부에 따라 isHidden 조절
    
    @IBOutlet var reviewGroup1: UIView!
    @IBOutlet var reviewGroup2: UIView!
    
    @IBOutlet var reviewViews: [UIView]!
    @IBOutlet var reviewImgs: [UIImageView]!

    weak var delegate: ReviewBtnDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBAction func reviewAddBtnTapped(_ sender: Any) {
        delegate?.reviewBtnDelegate(cell: self)
    }
}
