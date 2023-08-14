//
//  ReviewViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/14.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    var selectedReviews: Set<String> = []
    
    @IBOutlet var reviewAddBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for btn in buttons{
            btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            btn.layer.cornerRadius = 20
            btn.layer.borderWidth = 0.8
        }
        
        updateBtnColor()
        decideReviewAddBtnShape()
    }
    
    //전체 버튼의 색을 refresh하는 함수
    func updateBtnColor(){
        for btn in buttons{
            //필터가 선택되어 있는 경우
            if selectedReviews.contains(btn.titleLabel!.text!){
                btn.layer.borderColor = UIColor(named: "White")!.cgColor
                btn.backgroundColor = .white
                btn.tintColor = .black
            }
            //필터가 선택되어 있지 않은 경우
            else{
                btn.layer.borderColor = UIColor(named: "DarkGray")!.cgColor
                btn.backgroundColor = UIColor(named: "G4")
                btn.tintColor = .white
            }
        }
    }
    
    func decideReviewAddBtnShape(){
        if selectedReviews.count == 0{
            reviewAddBtn.tintColor = UIColor(named: "LightGray")
            reviewAddBtn.backgroundColor = UIColor(named: "Gray")
            reviewAddBtn.isEnabled = false
        }
        else{
            reviewAddBtn.backgroundColor = UIColor(named: "MainOrange")
            reviewAddBtn.tintColor = UIColor(named: "White")
            reviewAddBtn.isEnabled = true
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        //선택되어 있는 상태인 경우 (선택 -> 선택 안함)
        if selectedReviews.contains(sender.titleLabel!.text!){
            selectedReviews.remove(sender.titleLabel!.text!)
            sender.layer.borderColor = UIColor(named: "DarkGray")!.cgColor
            sender.backgroundColor = UIColor(named: "G4")
            sender.tintColor = .white
            
        }
        //선택되어 있지 않은 상태인 경우 (선택 안함 -> 선택)
        else{
            selectedReviews.insert(sender.titleLabel!.text!)
            sender.layer.borderColor = UIColor(named: "White")!.cgColor
            sender.backgroundColor = .white
            sender.tintColor = .black
        }
        
        decideReviewAddBtnShape()
    }
    
    @IBAction func reviewAddBtnTapped(_ sender: Any) {
        print("리뷰 추가 버튼 눌림")
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
