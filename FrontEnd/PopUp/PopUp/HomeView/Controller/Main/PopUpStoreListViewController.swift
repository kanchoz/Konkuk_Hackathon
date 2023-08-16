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
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
}


extension PopUpStoreListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntireStoreListTVCell", for: indexPath) as! EntireStoreListTVCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
}
