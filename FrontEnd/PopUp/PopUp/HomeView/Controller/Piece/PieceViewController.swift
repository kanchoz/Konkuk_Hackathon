//
//  PieceViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/12.
//

import UIKit

class PieceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    
    @IBOutlet var makePieceBtn: UIButton!
    @IBOutlet var pieceBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var img = ["Piece1", "Piece2", "Piece3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        //tableView.layer.zPosition = -1
        
        let borderColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1.0)
        makePieceBtn.layer.borderColor = borderColor.cgColor
        makePieceBtn.layer.borderWidth = 1.0 // 테두리 두께 설정
        let cornerRadius: CGFloat = 10.0 // 적절한 값을 선택하세요
        makePieceBtn.layer.cornerRadius = cornerRadius
        
        // Create a string with the main text and the colored word
        let mainText = "나만의 방문조각 만들기"
        let coloredText = "3개"
        let tailText = " 있어요!"

        // Combine the main text, colored text, and tail text
        let attributedText = NSMutableAttributedString(string: mainText)
        attributedText.append(NSAttributedString(string: "                     "))
//        let coloredAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(named: "MainOrange")!]
//        let coloredAttributedString = NSAttributedString(string: coloredText, attributes: coloredAttributes)
//        attributedText.append(coloredAttributedString)
//        attributedText.append(NSAttributedString(string: tailText))
        
        // Create a system image with white color
        if let image = UIImage(systemName: "arrow.forward")?.withTintColor(.white, renderingMode: .alwaysOriginal) {
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = image
            let imageString = NSAttributedString(attachment: imageAttachment)
            attributedText.append(NSAttributedString(string: "               "))
            attributedText.append(imageString)
        }

        // Assign the attributed text to the button's title label
        makePieceBtn.titleLabel?.numberOfLines = 1
        makePieceBtn.titleLabel?.lineBreakMode = .byTruncatingTail
        makePieceBtn.contentHorizontalAlignment = .left
        makePieceBtn.setAttributedTitle(attributedText, for: .normal)
        makePieceBtn.setAttributedTitle(attributedText, for: .normal)


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

    @IBAction func PieceBtn(_ sender: UIButton) {
        let nextVC = storyboard!.instantiateViewController(withIdentifier: "MakePieceViewController") as! MakePieceViewController
        nextVC.modalPresentationStyle = .overFullScreen
        present(nextVC, animated: false)
    }
    
}
