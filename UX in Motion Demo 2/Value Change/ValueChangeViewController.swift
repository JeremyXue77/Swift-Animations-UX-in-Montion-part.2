//
//  ValueChangeViewController.swift
//  UX in Motion Demo 2
//
//  Created by JeremyXue on 2018/6/25.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ValueChangeViewController: UIViewController {

    @IBOutlet weak var staticLabel: UILabel!
    
    @IBOutlet weak var dynamicLabel: UILabel!
    
    @IBAction func valueChange(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            staticLabel.text = "Static Volume: \(Int(sender.value)) %"
        case 1:
            dynamicLabel.text = "Dynamic Volume: \(Int(sender.value)) %"
        default:
            break
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
