//
//  AfterLoginViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/15.
//

import UIKit
import Alamofire

class AfterLoginViewController: UIViewController {
    
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageViews: [UIImageView]!
    var currentIndex: Int = 0
    var timer: Timer?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAutoScroll()
        
        print("\n\n\n\nddsdsdsdsdssdsdsdsssdn\n")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("로그인 확인")
        let defaults = UserDefaults.standard
        let check = defaults.value(forKey: "isLoggedIn")
        if check as! Bool{
            let name = "ㅇㅇㅇ"
            nicknameLabel.text = "\(name)님,\n안녕하세요!"
            //이름 요청
        }
        //로그인이 되어 있지 않은 상태
        else{
            let sb  = UIStoryboard(name: "LoginView", bundle: nil)
            let loginVC = sb.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
            print(loginVC)
            loginVC.modalTransitionStyle = .coverVertical
            loginVC.modalPresentationStyle = .fullScreen
            
            self.present(loginVC, animated: false, completion: nil)
        }
    }
    
    
    
    @IBAction func startBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func startAutoScroll() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    
    @objc func autoScroll() {
        let nextIndex = (currentIndex + 1) % imageViews.count
        scrollToIndex(index: nextIndex)
    }
    
    func scrollToIndex(index: Int) {
        currentIndex = index
        let xOffset = CGFloat(index) * scrollView.frame.width * 0.55
        UIView.animate(withDuration: 2.5, delay: 0, options: .curveLinear, animations: {
            self.scrollView.contentOffset.x = xOffset
        }, completion: nil)
    }
}
