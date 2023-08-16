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
    
    var imgName: String = ""
    
    var img: UIImage?
   
    var myImageName: String = ""
    var cardImageName: String = ""
    
    var mgdImage: UIImage?
    var cardImg: UIImage?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cardImageView.image = UIImage(named: "cardImage")
        cardImageView.image = cardImg
        myImageView.image = img
        
        backBtn.setTitle("", for: .normal)
        backBtn.setImage(UIImage(named: "NavBack"), for: .normal)
        saveBtn.layer.cornerRadius = 0
        shareBtn.layer.cornerRadius = 0
        let buttonWidth = UIScreen.main.bounds.width / 2
        shareBtn.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        setuplabel()
        
    }
    
    func setuplabel(){
        if(imgName == "11Frame"){
            visitedLabel.text = "2023년 9월 15일"
            popupLabel.text = "짱구는 못말려"
            infoLabel.text = "인기 만화 '짱구는 못말려'를 주제로 한 다양한 이벤트와 상품들이 준비된 기타 팝업스토어"
            locaLabel.text = "서울 마포구 망원로 456번길"
            snsLabel.text = "@jingunamotmalryeo_event"
        }else if(imgName == "9Frame"){
            visitedLabel.text = "2023년 8월 15일"
            popupLabel.text = "뉴진스"
            infoLabel.text = "연예인들이 사랑하는 다양한 브랜드들의 제품을 만나볼 수 있는 뉴진스 팝업스토어"
            locaLabel.text = "서울 강남구 역삼로 123번길"
            snsLabel.text = "@NEW_JEANS"
        }else{
            visitedLabel.text = "2023년 6월 15일"
            popupLabel.text = "토일렛 페이퍼"
            infoLabel.text = "유니크하고 창의적인 아트 매거진 '토일렛 페이퍼'의 다양한 작품과 이벤트를 즐길 수 있는 기타 팝업스토어"
            locaLabel.text = "서울 강북구 도봉로 789번길"
            snsLabel.text = "@TLTPPR"
        }
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
                    self.mgdImage = mergedImage
                    print("이미지가 사진 앨범에 저장되었습니다.")
                    print(mergedImage)
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
        
        let shareText: String = "방문조각"
        let shareImage = mgdImage // 이미지 객체를 따로 저장

        let activityViewController = UIActivityViewController(activityItems: [shareText, shareImage].compactMap { $0 }, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [.postToTwitter, .postToWeibo, .postToVimeo, .postToFlickr, .postToFacebook, .postToTencentWeibo]

        self.present(activityViewController, animated: true, completion: nil)

    }
    
    
    
}
