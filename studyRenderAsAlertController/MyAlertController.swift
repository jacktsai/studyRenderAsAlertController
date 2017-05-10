//
//  MyAlertController.swift
//  studyRenderAsAlertController
//
//  Created by Jack Tsai on 2017/5/10.
//

import UIKit

class MyAlertController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        definesPresentationContext = true
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 20
        closeButton.addTarget(self, action: #selector(touchDown(sender:)), for: .touchDown)
        closeButton.addTarget(self, action: #selector(touchUp(sender:)), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(touchUp(sender:)), for: .touchUpOutside)
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func touchDown(sender: UIButton) {
        sender.backgroundColor = UIColor(white: 0.8, alpha: 1)
    }
    
    func touchUp(sender: UIButton) {
        sender.backgroundColor = nil
    }
}
