//
//  MyAlertController.swift
//  studyRenderAsAlertController
//
//  Created by Jack Tsai on 2017/5/10.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 修飾 contentView 的四角為圓邊
        contentView.layer.cornerRadius = 20
        // 將 contentView 放大為 1.2 倍
        contentView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        // 將 contentView 設為透明
        contentView.alpha = 0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 使用動畫的方式呈現 contentView
        UIView.animate(withDuration: 0.3) {
            self.contentView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.contentView.alpha = 1
        }
    }
    
    @IBAction func login() {
        // TODO 在這裡寫登入邏輯
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
}






