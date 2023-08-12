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
        cell.nameLabel.text = "뉴진스 버니랜드        ㄴ"
        return cell
    }
    
    
}
