//
//  VerifyViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/16.
//

import UIKit

class VerifyViewController: UIViewController {

    @IBOutlet var tf: UITextField!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tf.delegate = self
        
//        self.showToast(message: "방문코드가 일치하지 않습니다.")
        // Do any additional setup after loading the view.
    }
    
    func setDisable(){
        let color = UIColor(hex: 999999)
        button.isEnabled = false
        button.backgroundColor = color
        button.tintColor = UIColor(named: "G2")
    }
    
    func setAble(){
        button.isEnabled = true
        button.backgroundColor = UIColor(named: "MainOrange")
        button.tintColor = UIColor(named: "White")
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
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        print("다음 버튼이 눌림")
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension VerifyViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        
        if newText.isEmpty{
            setDisable()
        }
        else{
            setAble()
        }
        
        return true
    }
}


extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}