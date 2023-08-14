//
//  PopupFilterViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/14.
//

import UIKit


class PopupFilterViewController: UIViewController {
    
    @IBOutlet var filterBtn: [UIButton]!
    @IBOutlet var applyBtn: UIButton!
    @IBOutlet var resetBtn: UIButton!
    var selectedFilters: Set<String> = []
    weak var dataSendDelegate: DataSendDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        
        resetBtn.layer.cornerRadius = 25
        resetBtn.layer.borderWidth = 0.8
        resetBtn.layer.borderColor = UIColor(named: "White")!.cgColor
        
        applyBtn.layer.cornerRadius = 25
        applyBtn.layer.borderWidth = 0.8
        applyBtn.layer.borderColor = UIColor(named: "White")!.cgColor
        
        for btn in filterBtn{
            btn.addTarget(self, action: #selector(filterBtnTapped(_:)), for: .touchUpInside)
            btn.layer.cornerRadius = 20
            btn.layer.borderWidth = 0.8
        }
        updateBtnColor()
    }
    
    //전체 버튼의 색을 refresh하는 함수
    func updateBtnColor(){
        for btn in filterBtn{
            //필터가 선택되어 있는 경우
            if selectedFilters.contains(btn.titleLabel!.text!){
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
    
    //필터 버튼이 눌렸을때
    @objc func filterBtnTapped(_ sender: UIButton){
        //선택되어 있는 상태인 경우 (선택 -> 선택 안함)
        if selectedFilters.contains(sender.titleLabel!.text!){
            selectedFilters.remove(sender.titleLabel!.text!)
            sender.layer.borderColor = UIColor(named: "DarkGray")!.cgColor
            sender.backgroundColor = UIColor(named: "G4")
            sender.tintColor = .white
            
        }
        //선택되어 있지 않은 상태인 경우 (선택 안함 -> 선택)
        else{
            selectedFilters.insert(sender.titleLabel!.text!)
            sender.layer.borderColor = UIColor(named: "White")!.cgColor
            sender.backgroundColor = .white
            sender.tintColor = .black
        }
    }
    
    //뒤로 가기 버튼
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        //필터를 저장한 배열 초기화 후 버튼 색상 갱신
        selectedFilters.removeAll()
        updateBtnColor()
    }
    
    @IBAction func applyBtnTapped(_ sender: Any) {
        //이전 화면에 data를 전달하는 코드
        dataSendDelegate?.didReceiveData(data: selectedFilters)
        dismiss(animated: true)
        
    }

}

