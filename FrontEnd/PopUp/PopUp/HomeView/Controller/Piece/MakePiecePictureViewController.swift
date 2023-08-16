//
//  MakePiecePictureViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/15.
//

import UIKit

class MakePiecePictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

   
    @IBOutlet var snsLabel: UILabel!
    @IBOutlet var locaLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var popupLabel: UILabel!
    @IBOutlet var visitLabel: UILabel!
    @IBOutlet var selectedPicBtn: UIButton!
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var backBtn: UIButton!
    
    var imgName: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.setTitle("", for: .normal)
        backBtn.setImage(UIImage(named: "NavBack"), for: .normal)
        selectedPicBtn.setTitle("", for: .normal)
        selectedPicBtn.setImage(UIImage(named: "selectPic"), for: .normal)
        //myImageView.image = UIImage(named: "Piece1")
        //cardImageView.image = UIImage(named: "cardImage")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectPicBtnTapped(_:)))
        selectedPicBtn.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ew;ofjwefewfe")
        setuplabel()
        print(imgName)
        cardImageView.image = UIImage(named: imgName)
    }
    
    func setuplabel(){
        if(imgName == "11Frame"){
            visitLabel.text = "2023년 9월 15일"
            popupLabel.text = "짱구는 못말려"
            infoLabel.text = "인기 만화 '짱구는 못말려'를 주제로 한 다양한 이벤트와 상품들이 준비된 기타 팝업스토어"
            locaLabel.text = "서울 마포구 망원로 456번길"
            snsLabel.text = "@jingunamotmalryeo_event"
        }else if(imgName == "9Frame"){
            visitLabel.text = "2023년 8월 15일"
            popupLabel.text = "뉴진스"
            infoLabel.text = "연예인들이 사랑하는 다양한 브랜드들의 제품을 만나볼 수 있는 뉴진스 팝업스토어"
            locaLabel.text = "서울 강남구 역삼로 123번길"
            snsLabel.text = "@NEW_JEANS"
        }else{
            visitLabel.text = "2023년 6월 15일"
            popupLabel.text = "토일렛 페이퍼"
            infoLabel.text = "유니크하고 창의적인 아트 매거진 '토일렛 페이퍼'의 다양한 작품과 이벤트를 즐길 수 있는 기타 팝업스토어"
            locaLabel.text = "서울 강북구 도봉로 789번길"
            snsLabel.text = "@TLTPPR"
        }
    }
    
    
    @IBAction func selectedBtnTapped(_ sender: UIButton) {
        let nextVC = storyboard!.instantiateViewController(withIdentifier: "MakePiecePictureViewController") as! MakePiecePictureViewController
        self.definesPresentationContext = true
        nextVC.modalPresentationStyle = .overFullScreen
        
        present(nextVC, animated: false, completion: nil)
    }
    
    // 이미지 선택 버튼이 탭되었을 때 실행되는 메서드
    @objc func selectPicBtnTapped(_ sender: UIButton) {
        print("tappp")
        showImagePicker()
    }
    
    // 이미지 피커를 표시하는 메서드
    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self // 델리게이트 설정
        imagePicker.sourceType = .photoLibrary // 사진 라이브러리에서 이미지 선택
        present(imagePicker, animated: true, completion: nil)
    }
    
    // 이미지 선택이 완료되었을 때 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택한 이미지를 가져옴
        if let selectedImage = info[.originalImage] as? UIImage {
            // 선택한 이미지를 myImageView에 설정
            myImageView.image = selectedImage
            
            // 이미지 피커를 닫음
            picker.dismiss(animated: true, completion: nil)
            
            // selectPicBtn 숨기기
            selectedPicBtn.isHidden = true
        }
    }
    
    // 이미지 선택이 취소되었을 때 호출되는 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커를 닫음
        picker.dismiss(animated: true, completion: nil)
    }
    
    func setupLabel(){
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let nextVC = storyboard!.instantiateViewController(identifier: "PieceSaveViewController") as! PieceSaveViewController
        print("image")
        print(myImageView.image)
        nextVC.imgName = self.imgName
        nextVC.img = myImageView.image
        nextVC.cardImg = UIImage(named: imgName)
        nextVC.modalPresentationStyle = .overFullScreen
        present(nextVC, animated: false)
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        
    }
    
}
