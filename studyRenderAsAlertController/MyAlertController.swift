//
//  MyAlertController.swift
//  studyRenderAsAlertController
//
//  Created by Jack Tsai on 2017/5/10.
//

import UIKit

class MyAlertController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 20
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
