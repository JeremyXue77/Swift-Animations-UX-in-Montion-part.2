//
//  Cloning2ViewController.swift
//  UX in Motion Demo 2
//
//  Created by JeremyXue on 2018/6/29.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class Cloning2ViewController: UIViewController {
    
    var isOpen = false
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuButton: UIButton! {
        didSet {
            menuButton.layer.cornerRadius = menuButton.frame.height / 2
            menuButton.clipsToBounds = true
        }
    }
    
    @IBOutlet var otherButton: [UIButton]! {
        didSet {
            for button in otherButton {
                button.layer.cornerRadius = button.frame.height / 2
                button.clipsToBounds = true
            }
        }
    }
    
    
    @IBAction func showMenu(_ sender: UIButton) {
        
        if isOpen == false {
            showMenu()
        } else {
            hideMenu()
        }
        
        isOpen = !isOpen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showMenu() {
        
        buttonAnimation()
        
        UIView.animate(withDuration: 1, animations: {
            self.menuView.transform = CGAffineTransform.identity
            self.menuView.transform = CGAffineTransform(rotationAngle: .pi)
            self.menuView.transform = CGAffineTransform.identity
        })
    }
    
    
    func hideMenu() {
        
        buttonAnimation()
        
        UIView.animate(withDuration: 1, animations: {
            self.menuView.transform = CGAffineTransform(rotationAngle: .pi)
            self.menuView.transform = CGAffineTransform.identity
            self.menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
    }
    
    func buttonAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.setMenuButtonFrame(width: 150)
            self.menuButton.transform = CGAffineTransform(rotationAngle: .pi)
        }) { (finish) in
            UIView.animate(withDuration: 0.5, animations: {
                self.setMenuButtonFrame(width: 100)
                self.menuButton.transform = CGAffineTransform.identity
            })
        }
    }
    
    func setMenuButtonFrame(width:CGFloat){
        self.menuButton.frame = CGRect(x: 0, y: 0, width: width, height: width)
        self.menuButton.layer.cornerRadius = width / 2
        self.menuButton.center = self.view.center
    }

}
