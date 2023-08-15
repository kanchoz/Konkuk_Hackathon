//
//  CustomPresentationController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/15.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        let screenHeight = UIScreen.main.bounds.height
        let yPosition = screenHeight * (2.0 / 3.0) // 1/3 위치로 설정
        return CGRect(x: 0, y: yPosition, width: containerView!.bounds.width, height: screenHeight - yPosition)
    }
}
