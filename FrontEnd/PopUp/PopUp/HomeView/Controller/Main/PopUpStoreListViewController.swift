//
//  PopUpStoreListViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/17.
//

import UIKit

class PopUpStoreListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    var list:[StoreSimple] = []
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
}


extension PopUpStoreListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntireStoreListTVCell", for: indexPath) as! EntireStoreListTVCell
        cell.selectionStyle = .none
        cell.category.text = list[indexPath.row].category
        cell.duration.text = list[indexPath.row].duration
        cell.img.image = UIImage(named: "\(list[indexPath.row].id)Thumbnail")
        cell.location.text = list[indexPath.row].location
        cell.name.text = list[indexPath.row].name
        
        return cell
    }
    
    
    
}
