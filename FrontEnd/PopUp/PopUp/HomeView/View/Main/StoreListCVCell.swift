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
    
    override func awakeFromNib(){
        storeListTV.delegate = self
        storeListTV.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storeListTV.dequeueReusableCell(withIdentifier: "StoreListTVCell") as! StoreListTVCell
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sb = UIStoryboard(name: "PieceInfoViewController", bundle: nil)
        let storeInfoView = sb.instantiateViewController(withIdentifier: "PieceInfoViewController") as! PieceInfoViewController
        storeInfoView.modalPresentationStyle = .fullScreen

        self.window?.rootViewController?.present(storeInfoView, animated: true, completion: nil)
        
    }
}
