//
//  CloningViewController.swift
//  UX in Motion Demo 2
//
//  Created by JeremyXue on 2018/6/29.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class CloningViewController: UIViewController {
    
    var isStart = false
    var cloningView:UIView!

    @IBOutlet weak var whiteView: UIView! {
        didSet {
            whiteView.layer.cornerRadius = whiteView.frame.height / 2
            whiteView.clipsToBounds = true
        }
    }
    
    @IBAction func cloningAnimation(_ sender: UIButton) {
        
        if isStart {
            isStart = false
            
            UIView.animate(withDuration: 0.4, animations: {
                self.whiteView.transform = CGAffineTransform.identity
                self.cloningView.transform = CGAffineTransform.identity
            }) { (finish) in
                self.cloningView.removeFromSuperview()
            }
            
        } else {
            isStart = true
            view.addSubview(cloningView)
            
            UIView.animate(withDuration: 0.4) {
                self.whiteView.transform = CGAffineTransform(translationX: 0, y: -self.whiteView.frame.height)
                self.cloningView.transform = CGAffineTransform(translationX: 0, y: self.cloningView.frame.height)
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cloningView = createCloningView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createCloningView() -> UIView {
        let cloningView = UIView()
        cloningView.frame = whiteView.frame
        cloningView.backgroundColor = UIColor.white
        cloningView.layer.cornerRadius = whiteView.frame.height / 2
        cloningView.clipsToBounds = true
        
        return cloningView
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
