//
//  SliderView.swift
//  studyRenderAsAlertController
//
//  Created by Jack Tsai on 2017/5/11.
//  Copyright © 2017年 wa0327. All rights reserved.
//

import UIKit

@IBDesignable class SliderView: UIControl {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var text: UITextField!
    
    @IBInspectable var max: Float = 10 {
        didSet {
            slider.maximumValue = max
        }
    }
    
    @IBInspectable var min: Float = 0 {
        didSet {
            slider.minimumValue = min
        }
    }
    
    @IBInspectable var value: Float = 0 {
        didSet {
            slider.value = value
            valueChanged(self)
        }
    }
    
    override init(frame: CGRect) {
        print("init with frame")
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init? with a cdeoder")
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        print("awakeAfter using a decoder")
        return super.awakeAfter(using: aDecoder)
    }
    
    override func awakeFromNib() {
        print("awake from NIB")
        super.awakeFromNib()
    }
    
    func setup() {
        let bundle = Bundle.init(for: type(of: self))
        let view = bundle.loadNibNamed("SliderView", owner: self, options: nil)![0] as! UIView
        view.frame = bounds
        
        addSubview(view)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        value = sender.value
        valueChanged(self)
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text, let v = Float(text) {
            value = v
            valueChanged(self)
        }
    }
 
    func valueChanged(_ sender: SliderView) {
        text.text = "\(value)"
        sendActions(for: .valueChanged)
    }
}

class SliderViewController: UIViewController {
    @IBOutlet weak var maskView: MyView!
    
    @IBAction func slider1Changed(_ sender: SliderView) {
        maskView.backgroundColor = UIColor(white: 0.2, alpha: CGFloat(sender.value))
    }
    
    @IBAction func slider2Changed(_ sender: SliderView) {
        maskView.layer.opacity = sender.value
    }
}

@IBDesignable
class MyView: UIView {
    
    //    override class var layerClass: AnyClass {
    //        get {
    //            return CAShapeLayer.self
    //        }
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //    override var layer: CAShapeLayer {
    //        get {
    //            return super.layer as! CAShapeLayer
    //        }
    //    }
    
    func setup() {
        let l = self.layer
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        //        l.path = path.cgPath
        //        l.fillColor = UIColor(white: 0.5, alpha: 0.7).cgColor
        l.shadowColor = UIColor.gray.cgColor
        l.shadowRadius = 5
        l.shadowOpacity = 1
        l.shadowOffset = CGSize(width: 5, height: 5)
        //        l.strokeColor = UIColor.green.cgColor
        
        l.shadowPath = path.cgPath
        l.backgroundColor = UIColor(white: 0.5, alpha: 0.7).cgColor
        l.cornerRadius = 5
    }
}

extension UIView {
    func log(_ items: Any...) {
        #if (TARGET_OS_IPHONE)
            print(items)
        #else
            let logPath = "/Users/wa0327/dev/ios/XcodeLiveRendering.log"
            let fmgr = FileManager.default
            if !fmgr.fileExists(atPath: logPath) {
                fmgr.createFile(atPath: logPath, contents: Data(), attributes: nil)
            }
            
            if let fileHandle = FileHandle(forWritingAtPath: logPath) {
                fileHandle.seekToEndOfFile()
                
                let date = NSDate()
                //                let bundle = Bundle(for: type(of: self))
                //                if let application = bundle.object(forInfoDictionaryKey: "CFBundleName") as? String {
                if let data = "\(date) \(items)\n".data(using: String.Encoding.utf8, allowLossyConversion: true) {
                    fileHandle.write(data)
                }
                //                }
                fileHandle.closeFile()
            }
        #endif
    }
}
