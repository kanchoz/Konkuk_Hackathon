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
        setDisable()
//        self.showToast(message: "방문코드가 일치하지 않습니다.")
        // Do any additional setup after loading the view.
    }
    
    func setDisable(){
        button.isEnabled = false
        button.backgroundColor = UIColor(named: "G3")
        button.setTitleColor(UIColor(named: "G2"), for: .normal)
        button.tintColor = UIColor(named: "White")
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
        let nextSB = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard!.instantiateViewController(identifier: "QRViewController") as! QRViewController
        
        nextVC.transitioningDelegate = self
        nextVC.modalPresentationStyle = .custom
        present(nextVC, animated: true)
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension VerifyViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        print("textfied edit")
        if newText.isEmpty{
            setDisable()
        }
        else{
            setAble()
        }
        
        return true
    }
}

extension VerifyViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
