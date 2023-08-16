//
//  PieceDetailViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/12.
//

import UIKit
import Photos

class PieceDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var saveBtn: UIButton!
    
    
    @IBOutlet var SNSLabel: UILabel!
    @IBOutlet var shareBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var detailBtn: UIButton!

    var flag: Int?
    
    var imageName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.setTitle("", for: .normal)
        detailBtn.setTitle("", for: .normal)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        let buttonWidth = UIScreen.main.bounds.width / 2
        shareBtn.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
      
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func detailBtnTapped(_ sender: UIButton) {
        
    }
    
    func showToast(message : String, font: UIFont = UIFont.boldSystemFont(ofSize: 14.0)) {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.white
            toastLabel.textColor = UIColor.black
            toastLabel.font = font
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        //사진 저장 action 추가
        
      
        UIGraphicsEndImageContext()
        var image: UIImage?
        if(flag == 1){
            image = UIImage(named: "Piece1")
        }else if(flag == 2){
            image = UIImage(named: "Piece2")
        }else{
            image = UIImage(named: "Piece3")
        }

        // 합쳐진 이미지를 사진 앨범에 저장
        PHPhotoLibrary.shared().performChanges({
                    // 변경 내용을 기록합니다.
                    PHAssetChangeRequest.creationRequestForAsset(from: image!)
                }) { (success, error) in
                    if success {
                        print("이미지가 앨범에 저장되었습니다.")
                    } else {
                        print("이미지 저장에 실패했습니다. 오류: \(error?.localizedDescription ?? "알 수 없음")")
                    }
                }
        
        showToast(message: "사진이 저장되었습니다")
    }
    
    @IBAction func shareBtnTapped(_ sender: UIButton) {
        let shareText: String = "방문조각"
        let shareImage = UIImage(named: "Piece1") // 이미지 객체를 따로 저장

        let activityViewController = UIActivityViewController(activityItems: [shareText, shareImage].compactMap { $0 }, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [.postToTwitter, .postToWeibo, .postToVimeo, .postToFlickr, .postToFacebook, .postToTencentWeibo]

        self.present(activityViewController, animated: true, completion: nil)

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PieceDetailTableViewCell", for: indexPath) as! PieceDetailTableViewCell
        
        if(flag == 1){
            cell.pieceImg.image = UIImage(named: "Piece1")
            cell.selectionStyle = .none
            cell.visitLabel.text = "2023.07.18"
            cell.popupLabel.text = "TOILET PAPER X LONGCHAMP"
            cell.aboutLabel.text = "프랑스"//"프랑스 럭셔리 브랜드 룽샴과 아트매거진 토이렛페이퍼의 콜라보레이션 팝업 스토어"
            cell.locationLabel.text = "잠실 롯데월드목 1층 아트리움 광장\n서울 올림픽로 300 롯데월드몰"
            cell.SNSLabel.text = "@longchamp / @tpbeauty"
        }else if(flag == 2){
            cell.pieceImg.image = UIImage(named: "Piece2")
            cell.selectionStyle = .none
            cell.visitLabel.text = "2023.07.18"
            cell.popupLabel.text = "TOILET PAPER X LONGCHAMP"
            cell.aboutLabel.text = "프랑스"//"프랑스 럭셔리 브랜드 룽샴과 아트매거진 토이렛페이퍼의 콜라보레이션 팝업 스토어"
            cell.locationLabel.text = "잠실 롯데월드목 1층 아트리움 광장\n서울 올림픽로 300 롯데월드몰"
            cell.SNSLabel.text = "@longchamp / @tpbeauty"
        }else{
            cell.pieceImg.image = UIImage(named: "Piece3")
            cell.selectionStyle = .none
            cell.visitLabel.text = "2023.07.18"
            cell.popupLabel.text = "TOILET PAPER X LONGCHAMP"
            cell.aboutLabel.text = "프랑스"//"프랑스 럭셔리 브랜드 룽샴과 아트매거진 토이렛페이퍼의 콜라보레이션 팝업 스토어"
            cell.locationLabel.text = "잠실 롯데월드목 1층 아트리움 광장\n서울 올림픽로 300 롯데월드몰"
            cell.SNSLabel.text = "@longchamp / @tpbeauty"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 해당 행의 높이를 계산하여 반환
        return 800
    }
    

    
}
