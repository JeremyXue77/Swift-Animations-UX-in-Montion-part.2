//
//  ValueChange2ViewController.swift
//  UX in Motion Demo 2
//
//  Created by JeremyXue on 2018/6/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ValueChange2ViewController: UIViewController {
    
    var oldValue = 0
    var catWeight = 0
    
    @IBOutlet weak var catWeightLabel: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBAction func weightChange(_ sender: UIButton) {
        checkTextField()
        
        weightTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkTextField() {
        
        if Int(weightTextField.text!) == nil || weightTextField.text == "" {
            showAlert(title: "輸入格式錯誤", message: "檢查是否有非數字的字元。")
        } else {
            if Int(weightTextField.text!)! < 0 {
                showAlert(title: "數值過小", message: "請輸入大於 0 的數字。")
            } else if Int(weightTextField.text!)! > 60 {
                showAlert(title: "數值過大", message: "太胖啦！！")
            } else {
                catWeight = Int(weightTextField.text!)!
                valueChange()
            }
            
        }
    }
    
    func valueChange() {
        
        let value = catWeight - oldValue
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            
            if value > 0 {
                self.oldValue += 1
            } else {
                self.oldValue -= 1
            }
            
            self.catWeightLabel.text = "Cat Weight: \(self.oldValue) kg"
            
            if self.oldValue % 10 == 0 {
                self.changeCatImage(value: self.oldValue)
            }
            
            if self.catWeight == self.oldValue {
                timer.invalidate()
            }
        }
    }
    
    func showAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    

    func changeCatImage(value:Int) {
        let catImageArray = ["cat 1","cat 2","cat 3","cat 4","cat 5"]
        
        switch value / 10 {
        case 0,1,2,3,4:
            catImage.image = UIImage(named: catImageArray[value / 10])
        default:
            break
        }
    }

}
