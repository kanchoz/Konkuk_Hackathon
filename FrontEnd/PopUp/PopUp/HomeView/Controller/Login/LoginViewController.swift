//
//  LoginViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/15.
//

import UIKit

class LoginViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("로그인 확인")
        let defaults = UserDefaults.standard
        let check = defaults.value(forKey: "isLoggedIn")
        if check as! Bool{
            print("로그인 되어 있으 ")
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "webVC") as! KakaoWebViewViewController
        
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
}
