//
//  OverlayViewController.swift
//  UX in Motion Demo 2
//
//  Created by JeremyXue on 2018/6/28.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var changeBackgroundView: UIView!
    
    @IBAction func showChangeBackgroundView(_ sender: UIButton) {
        
        showChangeBackgroundView()
        
    }
    
    @IBAction func changeBackground(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            backgroundImage.image = UIImage(named: "dogBG1")
            hideChangeBackgroundView()
        case 1:
            backgroundImage.image = UIImage(named: "dogBG2")
            hideChangeBackgroundView()
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeBackgroundView.transform = CGAffineTransform(translationX: 0, y: changeBackgroundView.frame.height * 0.9)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showChangeBackgroundView() {
        UIView.animate(withDuration: 0.4) {
            self.changeBackgroundView.transform = CGAffineTransform.identity
        }
    }
    
    func hideChangeBackgroundView() {
        UIView.animate(withDuration: 0.4) {
            self.changeBackgroundView.transform = CGAffineTransform(translationX: 0, y: self.changeBackgroundView.frame.height * 0.9)
        }
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
