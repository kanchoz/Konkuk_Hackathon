//
//  MakePieceViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/15.
//

import UIKit

class MakePieceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet var backBtn: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    var dates : [String] = ["2023.08.01", "2023.08.01", "2023.08.01"]
    var cates : [String] = ["기타", "연예인", "기타"]
    var names : [String] = ["짱구는 못말려 : 시네마 퍼레이드 투어", "뉴진스 버니랜드 (스포티파이X뉴진스)", "토일렛페이터 X 롱샴"]
    var duras: [String] = ["2023년 7월 28일 ~ 2023년 8월 6일", "2023년 7월 28일 ~ 2023년 8월 6일", "2023년 7월 28일 ~ 2023년 8월 6일"]
    var imgNames: [String] = ["11Thumbnail", "Piece2", "Piece3"]
    var locas : [String] = ["서울 서대문구", "서울 송파구", "서울 종로구"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backBtn.setTitle("", for: .normal)
        backBtn.setImage(UIImage(named: "NavBack"), for: .normal)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    @IBAction func makeBtnTapped(_ sender: UIButton) {
        let nextVC = storyboard!.instantiateViewController(withIdentifier: "MakePiecePictureViewController") as! MakePiecePictureViewController
        nextVC.modalPresentationStyle = .overFullScreen
        present(nextVC, animated: false)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MakePieceTableViewCell") as! MakePieceTableViewCell
        cell.dateLabel.text = dates[indexPath.row]
        cell.cateLabel.text = cates[indexPath.row]
        cell.nameLabel.text = names[indexPath.row]
        cell.pieceImg.image = UIImage(named: imgNames[indexPath.row])
        cell.durationLabel.text = duras[indexPath.row]
        
        return cell
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    // 테이블뷰 셀의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260 // 원하는 높이로 설정
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard!.instantiateViewController(withIdentifier: "MakePiecePictureViewController") as! MakePiecePictureViewController
        
        if(indexPath.row == 0){
            nextVC.imgName = "11Frame"
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true)
        }else if(indexPath.row == 1){
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.imgName = "9Frame"
            present(nextVC, animated: true)
        }else{
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.imgName = "10Frame"
            present(nextVC, animated: true)
        }
    }
}
