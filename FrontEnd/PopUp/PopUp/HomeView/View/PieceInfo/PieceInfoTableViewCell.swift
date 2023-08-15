//
//  PieceInfoTableViewCell.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/15.
//

import UIKit

class PieceInfoTableViewCell: UITableViewCell {

    @IBOutlet var reviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Cell 모양 설정
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.backgroundColor = UIColor.black
        
        // 선택 효과 및 구분선 비활성화
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0))
    }
    
}
