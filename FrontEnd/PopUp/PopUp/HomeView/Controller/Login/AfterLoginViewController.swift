//
//  AfterLoginViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/15.
//

import UIKit

class AfterLoginViewController: UIViewController {
    
    @IBOutlet var nicknameLabel: UILabel!

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageViews: [UIImageView]!
    var currentIndex: Int = 0
    var timer: Timer?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("s")
        startAutoScroll()
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
