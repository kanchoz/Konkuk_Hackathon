//
//  StoreInfoViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/13.
//

import UIKit

class StoreInfoViewController: UIViewController {

    @IBOutlet var name: UILabel!
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var img1: UIImageView!
    
    @IBOutlet var img2: UIImageView!
    
    @IBOutlet var img3: UIImageView!
    
    
    var data:Store?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        name.text = data!.name
        locationLabel.text = data!.location
        img1.image = UIImage(named: "\(data!.id)SearchCVImg1")
        img2.image = UIImage(named: "\(data!.id)SearchCVImg2")
        img3.image = UIImage(named: "\(data!.id)SearchCVImg3")
    }
    
    @IBAction func detailBtnTapped(_ sender: Any) {
        
        let sb = UIStoryboard(name: "PieceInfoViewController", bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: "PieceInfoViewController") as! PieceInfoViewController
        nextVC.id = data!.id
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
}
