//
//  ViewController.swift
//  studyRenderAsAlertController
//
//  Created by Jack Tsai on 2017/5/10.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func presentUIAlertController() {
        let vc = UIAlertController(title: "Hello, world!", message: "message from UIAlertController", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "CLOSE", style: .default) { (_) in
            vc.dismiss(animated: true, completion: nil)
        })
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func presentMyAlertController() {
        let vc = MyAlertController()
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}

