//
//  StoredPopUpViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/14.
//

import UIKit

class StoredPopUpViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }    
}

extension StoredPopUpViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoredTVCell", for: indexPath) as! StoredTableViewCell
        cell.delegate = self
        return cell
    }

}

extension StoredPopUpViewController: DeleteBtnDelegate{
    func deleteBtnTapped(cell: StoredTableViewCell) {
        let alert = UIAlertController(title: "알림", message: "삭제하시겠습니까?", preferredStyle: .alert)
            
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { _ in
            //삭제 작업을 수행
        }
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true, completion: nil)
    }
}
