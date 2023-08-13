//
//  DataSendDelegate.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/12.
//

import Foundation

protocol DataSendDelegate: AnyObject{
    func didReceiveData(data: Set<String>)
}
