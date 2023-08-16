//
//  Login2ViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/16.
//

import UIKit

class Login2ViewController: UIViewController {

    @IBOutlet var pwTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    var eyeButton = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        setPasswordShownButtonImage()
        // Do any additional setup after loading the view.
    }
    
    
    private func setPasswordShownButtonImage() {
        eyeButton = UIButton.init(primaryAction: UIAction(handler: { [self] _ in
            pwTF.isSecureTextEntry.toggle()
            self.eyeButton.isSelected.toggle()
        }))

        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear

        let buttonSize: CGFloat = 24
        let buttonImage = UIImage(named: "password-hidden-icon")

        eyeButton.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        eyeButton.setImage(buttonImage, for: .normal)
        eyeButton.setImage(UIImage(named: "password-shown-icon"), for: .selected)

        // 비밀번호 필드 초기 설정
        pwTF.isSecureTextEntry = true
        self.eyeButton.isSelected = false

        self.eyeButton.configuration = buttonConfiguration
        self.pwTF.rightView = eyeButton
        self.pwTF.rightViewMode = .always
    }
    


    @IBAction func loginBtnTapped(_ sender: UIButton) {
        var id = emailTF.text
        var pw = pwTF.text
        
        showToast(message: "로그인 성공")
        
        
        let defaults = UserDefaults.standard
        
        defaults.set(true, forKey: "isLoggedIn")
        
        dismiss(animated: true)
    }
    
    func showToast(message: String, font: UIFont = UIFont.boldSystemFont(ofSize: 14.0)) {
        DispatchQueue.main.async {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.white
            toastLabel.textColor = UIColor.black
            toastLabel.font = font
            toastLabel.textAlignment = .center
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10
            toastLabel.clipsToBounds = true
            self.view.addSubview(toastLabel)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                UIView.animate(withDuration: 0.5, animations: {
                    toastLabel.alpha = 0.0
                }, completion: { _ in
                    toastLabel.removeFromSuperview()
                })
            }
        }
    }
    
}
