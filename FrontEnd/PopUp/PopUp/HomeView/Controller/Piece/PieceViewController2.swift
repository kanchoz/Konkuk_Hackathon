//
//  PieceViewController2.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/12.
//

import UIKit

class PieceViewController2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet var pieceBtn: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    
    var img = ["Piece1", "Piece2", "Piece3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10 // 가로 간격
        layout.minimumLineSpacing = 10 // 세로 간격
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
        view.addSubview(pieceBtn)
        self.view.bringSubviewToFront(pieceBtn)
        
    }
    

    @IBAction func pieceBtnTapped(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "PieceCollectionViewCell", for: indexPath) as! PieceCollectionViewCell
        cell.pieceImg.image = UIImage(named: img[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell")
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "PieceDetailViewController") as! PieceDetailViewController
        // 새로운 UINavigationController에 넣어서 모달로 표시
        //let navController = UINavigationController(rootViewController: collectionVC)
        //navController.modalPresentationStyle = .overFullScreen // 모달 표시 스타일 설정
        //detailVC.imageName = img[indexPath.row]
        detailVC.modalPresentationStyle = .fullScreen
        
        present(detailVC, animated: false, completion: nil)
        
    }
    

}

extension PieceViewController2: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

                    return CGSize(width: 180, height: 250)
                    
            }
}
