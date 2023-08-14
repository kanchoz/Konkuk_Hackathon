//
//  MyPageViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/14.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func storedPopUpBtnTapped(_ sender: Any) {
        let storedPopUpVC = self.storyboard?.instantiateViewController(identifier: "storedPopUp") as! StoredPopUpViewController
        
        storedPopUpVC.modalPresentationStyle = .fullScreen
        self.present(storedPopUpVC, animated: true, completion: nil)
    }
    
    @IBAction func visitedPopUpBtnTapped(_ sender: Any) {
        let visitedRecordVC = self.storyboard?.instantiateViewController(identifier: "visitedRecord") as! VisitedRecordViewController
        
        visitedRecordVC.modalPresentationStyle = .fullScreen
        self.present(visitedRecordVC, animated: true, completion: nil)
    }


}
