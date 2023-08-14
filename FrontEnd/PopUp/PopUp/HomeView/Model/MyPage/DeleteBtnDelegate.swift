//
//  DeleteBtnDelegate.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/15.
//

import Foundation

protocol DeleteBtnDelegate :AnyObject{
    func deleteBtnTapped(cell: StoredTableViewCell)
}
