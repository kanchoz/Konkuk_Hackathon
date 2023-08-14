//
//  VisitedRecordViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/14.
//

import UIKit

class VisitedRecordViewController: UIViewController {

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

extension VisitedRecordViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "visitedPopUpRecordTVCell", for: indexPath) as! VisitedPopUpRecordTableViewCell
        var reviewCnt = DummyReview.review[indexPath.row].count
        
        cell.delegate = self
        cell.reviewView.isHidden = true
        cell.reviewBtn.isHidden = false
        
        if reviewCnt == 0{
            cell.reviewView.isHidden = true
            cell.reviewBtn.isHidden = false
        }
        else{
            if reviewCnt < 3{
                cell.reviewView.isHidden = false
                cell.reviewGroup1.isHidden = false
                cell.reviewGroup2.isHidden = true
                cell.reviewBtn.isHidden = true
            }
            else{
                cell.reviewView.isHidden = false
                cell.reviewGroup1.isHidden = false
                cell.reviewGroup2.isHidden = false
                cell.reviewBtn.isHidden = true
            }
            for i in 0..<DummyReview.review[indexPath.row].count{
                if DummyReview.review[indexPath.row][i] == "kind"{
                    cell.reviewImgs[i].image = UIImage(named: "kindLabel")
                }
                else if DummyReview.review[indexPath.row][i] == "parking"{
                    cell.reviewImgs[i].image = UIImage(named: "carLabel")
                }
                else if DummyReview.review[indexPath.row][i] == "waiting"{
                    cell.reviewImgs[i].image = UIImage(named: "waitingLabel")
                }
                else if DummyReview.review[indexPath.row][i] == "food"{
                    cell.reviewImgs[i].image = UIImage(named: "coffeeLabel")
                }
                else if DummyReview.review[indexPath.row][i] == "enter"{
                    cell.reviewImgs[i].image = UIImage(named: "doorLabel")
                }
                else{
                    cell.reviewImgs[i].image = UIImage(named: "eventLabel")
                }
            }
        }
        return cell
    }
}

extension VisitedRecordViewController: ReviewBtnDelegate{
    func reviewBtnDelegate(cell: VisitedPopUpRecordTableViewCell) {
        let reviewVC = self.storyboard?.instantiateViewController(identifier: "reviewVC") as! ReviewViewController
        reviewVC.modalPresentationStyle = .fullScreen
        self.present(reviewVC, animated: true, completion: nil)
    }
}
