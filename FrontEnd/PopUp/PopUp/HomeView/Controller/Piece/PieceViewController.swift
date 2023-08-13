//
//  PieceViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/12.
//

import UIKit

class PieceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    
    @IBOutlet var pieceBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var img = ["Piece1", "Piece2", "Piece3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        //tableView.layer.zPosition = -1

        
        view.addSubview(pieceBtn)

        // UIButton 생성 및 설정
        pieceBtn.setTitle("", for: .normal)
        pieceBtn.setImage(UIImage(named: "pieceBtnTable"), for: .normal)
        self.view.bringSubviewToFront(pieceBtn)

        
    }
    
    @IBAction func piecebtnTapped(_ sender: UIButton) {
//        print("tapped")
//        let collectionVC = storyboard!.instantiateViewController(withIdentifier: "PieceViewController2") as! PieceViewController2
//        collectionVC.modalPresentationStyle = .overFullScreen
//        present(collectionVC, animated: false)
        print("tapped")
        let collectionVC = storyboard!.instantiateViewController(withIdentifier: "PieceViewController2") as! PieceViewController2
        self.definesPresentationContext = true
        // 새로운 UINavigationController에 넣어서 모달로 표시
        //let navController = UINavigationController(rootViewController: collectionVC)
        //navController.modalPresentationStyle = .overFullScreen // 모달 표시 스타일 설정
        collectionVC.modalPresentationStyle = .currentContext
        
        present(collectionVC, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PieceTableViewCell", for: indexPath) as! PieceTableViewCell
        let pieceName = img[indexPath.row]
        
        cell.pieceImg.image = UIImage(named: pieceName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 해당 행의 높이를 계산하여 반환
        return 500
    }


}
