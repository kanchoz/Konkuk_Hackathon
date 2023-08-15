//
//  PieceSaveViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/15.
//

import UIKit
import Photos

class PieceSaveViewController: UIViewController {

    @IBOutlet var backBtn: UIButton!
    @IBOutlet var shareBtn: UIButton!
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var snsLabel: UILabel!
    @IBOutlet var locaLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var popupLabel: UILabel!
    @IBOutlet var visitedLabel: UILabel!
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var myImageView: UIImageView!
    
    var img: UIImage?
   
    var myImageName: String = ""
    var cardImageName: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardImageView.image = UIImage(named: "cardImage")
        myImageView.image = img
        
        backBtn.setTitle("", for: .normal)
        backBtn.setImage(UIImage(named: "NavBack"), for: .normal)
        saveBtn.layer.cornerRadius = 0
        shareBtn.layer.cornerRadius = 0
        let buttonWidth = UIScreen.main.bounds.width / 2
        shareBtn.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
    }
    

    @IBAction func saveBtnTapped(_ sender: UIButton) {
        // 이미지 뷰를 합칠 이미지 크기로 합성
        UIGraphicsBeginImageContext(myImageView.frame.size)
        myImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        cardImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let mergedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // 합쳐진 이미지를 사진 앨범에 저장
        if let mergedImage = mergedImage {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: mergedImage)
            }, completionHandler: { success, error in
                if success {
                    print("이미지가 사진 앨범에 저장되었습니다.")
                    self.showToast(message: "사진이 저장되었습니다")
                } else {
                    print("이미지 저장에 실패하였습니다. 오류: \(error?.localizedDescription ?? "알 수 없음")")
                }
            })
        }
    }
    
    
    func showToast(message: String, font: UIFont = UIFont.boldSystemFont(ofSize: 14.0)) {
        DispatchQueue.main.async {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.white
            toastLabel.textColor = UIColor.black
            toastLabel.font = font
            toastLabel.textAlignment = .center
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10
            toastLabel.clipsToBounds = true
            self.view.addSubview(toastLabel)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                UIView.animate(withDuration: 0.5, animations: {
                    toastLabel.alpha = 0.0
                }, completion: { _ in
                    toastLabel.removeFromSuperview()
                })
            }
        }
    }

   
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func shareBtnTapped(_ sender: Any) {
        
    }
    
}
