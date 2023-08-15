//
//  NotificationViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/16.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension NotificationViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationTVCell", for: indexPath)
        
        return cell
    }
    
    
}
