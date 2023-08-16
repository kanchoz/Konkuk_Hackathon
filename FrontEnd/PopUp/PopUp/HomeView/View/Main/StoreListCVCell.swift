//
//  StoreListCVCell.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/09.
//

import UIKit
// MARK: - 팝업 스토어 목록 collectionView Cell, 안에 tableView를 가지고 있음. 각 tableView 안에 카테고리별 tableViewcell들이 나타남.
class StoreListCVCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var storeListTV: UITableView!
    
    var list: [StoreSimple] = []
    override func awakeFromNib(){
        storeListTV.delegate = self
        storeListTV.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var temp = min(4, list.count)
        return temp
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storeListTV.dequeueReusableCell(withIdentifier: "StoreListTVCell") as! StoreListTVCell
        cell.categoryLabel.text = list[indexPath.row].category
        cell.dateLabel.text = list[indexPath.row].duration
        cell.locationLabel.text = list[indexPath.row].location
        cell.nameLabel.text = list[indexPath.row].name
        cell.storeImg.image = UIImage(named: "\(list[indexPath.row].id)Thumbnail")
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sb = UIStoryboard(name: "PieceInfoViewController", bundle: nil)
        let storeInfoView = sb.instantiateViewController(withIdentifier: "PieceInfoViewController") as! PieceInfoViewController
        storeInfoView.modalPresentationStyle = .fullScreen
        storeInfoView.id = list[indexPath.row].id
        self.window?.rootViewController?.present(storeInfoView, animated: true, completion: nil)
        
    }
}
