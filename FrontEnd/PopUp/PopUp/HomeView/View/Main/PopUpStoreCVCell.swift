//
//  PopUpStoreCVCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/09.
//

import UIKit
// MARK: - 이번 주 핫한 팝업 스토어 collectionView Cell
class PopUpStoreCVCell: UICollectionViewCell {
    @IBOutlet var storeImg: UIImageView!
    
    @IBOutlet var buttonTapped: UIButton!
    
    var id: Int = 0
    
    weak var delegate: NextBtnDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        storeImg.image = UIImage(named: "\(id)HotStore")
        buttonTapped.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc func tapped() {
        delegate?.nextButtonTappedd(id: id)
        print("asdasdasdasdasd")
    }
}
