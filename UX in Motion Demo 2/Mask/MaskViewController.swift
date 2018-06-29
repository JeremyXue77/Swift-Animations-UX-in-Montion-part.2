//
//  MaskViewController.swift
//  UX in Motion Demo 2
//
//  Created by JeremyXue on 2018/6/27.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class MaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var isChanged = false
    
    let albumArray = ["linkin park 1","linkin park 2","linkin park 3","linkin park 4","linkin park 5"]
    
    var mask:CALayer!
    var whitePoint:CALayer!

    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTableView: UITableView!
    @IBOutlet weak var playerToolbar: UIToolbar!
    
    @IBAction func play(_ sender: UIBarButtonItem) {
        
        if isChanged == false {
            isChanged = true
            albumImageMaskAnimation()
            changeInterface()
        } else {
            isChanged = false
            resetInterface()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumTableView.backgroundColor = UIColor.black
        albumTableView.dataSource = self
        albumTableView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let name =  albumArray[indexPath.row]
        
        cell.imageView?.image = UIImage(named: name)
        cell.textLabel?.text = name
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return albumTableView.frame.height / 5
    }
    
    
    // MARK: - Custom Functions
    
    func albumImageMaskAnimation() {
        
        // Make a mask
        mask = CALayer()
        mask.bounds = CGRect(x: 0, y: 0, width: albumImage.frame.height, height: albumImage.frame.height)
        mask.cornerRadius = mask.frame.height / 2
        mask.masksToBounds = true
        mask.position = CGPoint(x: albumImage.bounds.maxX / 2, y: albumImage.bounds.maxY / 2)
        mask.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        albumImage.layer.mask = mask
        
        scaleMaskAnimation(fromValue: [3,3], toValue: [1,1], key: "small", completion: nil)
    }
    
    func makePoint() {
        whitePoint = CALayer()
        whitePoint.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        whitePoint.position = CGPoint(x: albumImage.bounds.maxX / 2, y: albumImage.bounds.maxY / 2)
        whitePoint.cornerRadius = 25
        whitePoint.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        
        albumImage.layer.addSublayer(whitePoint)
    }
    
    func changeInterface() {
        
        UIView.animate(withDuration: 1, animations: {
            self.albumImage.transform = CGAffineTransform(translationX: 0, y: self.albumTableView.frame.height / 2)
            self.playerToolbar.transform = CGAffineTransform(translationX: 0, y: self.albumTableView.frame.height)
            self.albumTableView.transform = CGAffineTransform(translationX: 0, y: self.albumTableView.frame.height)
        }) { (finish) in
            self.makePoint()
            self.spinAlbumImageAnimation()
        }
        
    }
    
    func scaleMaskAnimation(fromValue:[Int],toValue:[Int],key:String,completion:((Bool)->Void)?){
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 0.4
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        
        mask.add(animation, forKey: key)
        
        completion?(true)
    }
    
    func spinAlbumImageAnimation() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = 4
        animation.toValue = 2 * Double.pi
        animation.repeatCount = .infinity
        
        self.albumImage.layer.add(animation, forKey: "spin")
        
    }
    
    func resetInterface() {
        albumImage.layer.removeAnimation(forKey: "spin")
        mask.removeAnimation(forKey: "small")
        UIView.animate(withDuration: 1, animations: {
            self.albumImage.transform = CGAffineTransform.identity
            self.playerToolbar.transform = CGAffineTransform.identity
            self.albumTableView.transform = CGAffineTransform.identity
        }) { (finish) in
            self.scaleMaskAnimation(fromValue: [1,1], toValue: [3,3], key: "big", completion: { (finish) in
                self.whitePoint.removeFromSuperlayer()
            })
        }
        
    }
    
}
