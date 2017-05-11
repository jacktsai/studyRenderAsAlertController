//
//  ViewController.swift
//  studyRenderAsAlertController
//
//  Created by Jack Tsai on 2017/5/10.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func presentUIAlertController() {
        let vc = UIAlertController(title: "登入系統", message: "請輸入您的電子郵件帳號及密碼。", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "登入", style: .default, handler: nil))
        vc.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        vc.addTextField { (field) in
            field.placeholder = "電子郵件帳號"
        }
        vc.addTextField { (field) in
            field.placeholder = "密碼"
            field.isSecureTextEntry = true
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func presentMyAlertController() {
        let vc = LoginViewController()
        present(vc, animated: true, completion: nil)
    }
}







