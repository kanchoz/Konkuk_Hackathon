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
    
    //MARK: - 테이블 뷰 새로고침 구현
//    func reloadTableView(){
//        PopupManager.getMyAllSavedPopup { result in
//            switch result {
//            case .success(let messages):
//                // 메시지 배열을 받아와서 처리
//                self.chatMessages = messages.reversed()
//                for message in messages {
//                    // 각 메시지에 대한 처리 로직을 구현
//                    print("Message: \(message.content)")
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                    self.scrollToBottom()
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
//    }

    
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
