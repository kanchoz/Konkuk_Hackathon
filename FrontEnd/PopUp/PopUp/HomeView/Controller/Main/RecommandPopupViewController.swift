//
//  RecommandPopupViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import UIKit

class RecommandPopupViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet var collectionview: UICollectionView!
    @IBOutlet var backBtn: UIButton!
    
    var imas : [String] = ["Piece1", "Piece2", "Piece3", "Piece1", "Piece2", "Piece3"]
    var cats : [String] = ["패션", "연예인", "기타", "패션", "연예인", "기타"]
    var names: [String] = ["젠틀 몬스터 이즈백", "위글위글 랜드", "미스 디올", "페라가모", "마르헨제이", "엔믹스 빅웨이브"]
    var locas: [String] = ["서울 성동구", "서울 성동구", "서울 성동구", "서울 성동구", "서울 성동구", "서울 성동구"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backBtn.setTitle("", for: .normal)
        backBtn.setImage(UIImage(named: "NavBack"), for: .normal)
        collectionview.dataSource = self
        collectionview.delegate = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as! RecommandCollectionViewCell
        cell.rImage.image = UIImage(named: imas[indexPath.row])
        cell.cageLabel.text = cats[indexPath.row]
        cell.nameLabel.text = names[indexPath.row]
        cell.locaLabel.text = locas[indexPath.row]
        return cell
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: false)
    }
}

extension RecommandPopupViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

                    return CGSize(width: 173, height: 313)
                    
            }
}
