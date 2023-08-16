//
//  SearchDetailViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/12.
//

import UIKit

class SearchDetailViewController: UIViewController {
    
    @IBOutlet var searchTF: UITextField!
    @IBOutlet var tableView1: UITableView!
    @IBOutlet var tableView2: UITableView!
    
    @IBOutlet var preview: [UIView]!
    
    var data: StoreSimple?
    var resCnt = 0
    var list = ["뉴진스", "버니", "포도도", "몬스터", "젠틀 몬스터", "BTS", "노티드", "르세라핌", "베어", "블랙"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    func setUpUI(){
        show()
        searchTF.delegate = self
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView2.dataSource = self
        tableView2.delegate = self
        
        let placeholderText = "지역, 팝업 스토어 이름 검색"
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            .foregroundColor: UIColor(named: "Gray")!
        ]
        searchTF.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
    }

    @IBAction func searchBtnTapped(_ sender: Any) {
        if let text = searchTF.text, text.count < 2 {
                    let alert = UIAlertController(title: "알림", message: "검색어는 2글자 이상 입력해주세요.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
        } else {
            // 그 외에는 원하는 작업 수행
            hide()
        }
    }
    
    
    func hide(){
        for v in preview{
            v.isHidden = true
        }
        
        PopupDetailManager.searchPop(name: searchTF.text!) { response in
            switch response{
            case .success(let res):
                print(res)
//                self.data = res
            case .failure(_):
                print("err")
                
            }
        }
        
        for store in StoreSimpleList.entireList{
            if store.name.contains(searchTF.text!){
                data = store
                resCnt = 1
            }
        }
        tableView2.reloadData()
        tableView2.isHidden = false
        
        
        
    }
    
    func show(){
        for v in preview{
            v.isHidden = false
        }
        tableView2.isHidden = true
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
}

extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1{
            return 10
        }
        else{
            return resCnt
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RankingTableViewCell", for: indexPath) as! RankingTableViewCell
            cell.numLabel.text = String(indexPath.row + 1)
            cell.nameLabel.text = list[indexPath.row]
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchTVCell", for: indexPath) as! SearchTableViewCell
            cell.img.image = UIImage(named: "\(data!.id)Thumbnail")
            cell.data = data
            cell.category.text = data?.category
            cell.duration.text = data?.duration
            cell.location.text = data?.location
            cell.name.text = data?.name
            resCnt = 1
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == tableView1{
            tableView.deselectRow(at: indexPath, animated: true)
            searchTF.text = list[indexPath.row]
        }
        else{
            let sb = UIStoryboard(name: "PieceInfoViewController", bundle: nil)
            let nextVC = sb.instantiateViewController(identifier: "PieceInfoViewController") as! PieceInfoViewController
            nextVC.id = (data!.id)
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true)
        }
    }
}


extension SearchDetailViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
            if textField.text?.count == 0 {
                print("0")
                show()
            }
        }
}
