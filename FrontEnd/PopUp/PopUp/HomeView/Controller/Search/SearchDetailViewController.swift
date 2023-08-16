//
//  SearchDetailViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/12.
//

import UIKit

class SearchDetailViewController: UIViewController {
    
    @IBOutlet var searchTF: UITextField!
    @IBOutlet var tableView: UITableView!
    var list = ["뉴진스", "뉴진스 바니랜드", "포도도", "몬스터", "젠틀몬스터", "BTS", "노티드", "르세라핌", "베어", "블랙"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    func setUpUI(){
        tableView.dataSource = self
        tableView.delegate = self
        
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
            
            PopupDetailManager.
        }
    }
    
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankingTableViewCell", for: indexPath) as! RankingTableViewCell
        cell.numLabel.text = String(indexPath.row + 1)
        cell.nameLabel.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            searchTF.text = list[indexPath.row]
        }
}
