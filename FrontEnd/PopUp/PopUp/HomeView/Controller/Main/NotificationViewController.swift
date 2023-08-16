//
//  NotificationViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/16.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var alertName: [String] = ["방문 인증", "마감 임박", "추천", "방문인증", "추천", "업데이트", "마감임박", "오픈예정"]
    
    var alertTime: [String] = ["바니랜드 방문 인증이 안료되었습니다", "[패션] 젠틀몬스터 5일 남았어요", "Horok! Subway Liquor Trip!", "토일렛페이퍼X롱샴 방문 인증이 완료되었어요", "Horok! Subway Liquor Trip에 리뷰가 생겼어요", "[패션] 스타일러 그라운드는 어때요?", "북마크한 [연예인]바니랜드 5일 남았어요", "[기타]위글위글 팝업스토어 오픈이 4일 남았어요"]
    var alertDate: [String] = ["08.14", "08.14", "08.13", "08.13", "08.12", "08.11", "08.10", "08.09",]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationTVCell", for: indexPath) as! NotificationTableViewCell
        cell.contentLabel.text = alertName[indexPath.row]
        cell.dateLabel.text = alertDate[indexPath.row]
        cell.detailLabel.text = alertTime[indexPath.row]
        return cell
    }
    
    
}
