//
//  QRViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/15.
//

import UIKit

class QRViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet var makeBtn: UIButton!
    @IBOutlet var nextBtn: UIButton!
    
    var is_return: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if(is_return){
//            self.dismiss(animated: false, completion: nil)
//        }
        
        nextBtn?.layer.cornerRadius = 0
        makeBtn?.layer.cornerRadius = 0
        let buttonWidth = UIScreen.main.bounds.width / 2
        makeBtn?.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        nextBtn?.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("appear")
    }
    
    @IBAction func makeBtnTapped(_ sender: UIButton) {
        
        
        
        
        let nextSB = UIStoryboard(name: "PieceViewController", bundle: nil)
        let nextVC = nextSB.instantiateViewController(identifier: "MakePiecePictureViewController") as! MakePiecePictureViewController
        nextVC.imgName = "9Frame"
        nextVC.modalPresentationStyle = .overFullScreen
        
        present(nextVC, animated: true)
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
