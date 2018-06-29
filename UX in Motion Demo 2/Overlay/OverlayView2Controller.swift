//
//  OverlayViewController.swift
//  UX in Motion Demo 2
//
//  Created by JeremyXue on 2018/6/28.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class Overlay2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let weekArray = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday",]
    
    @IBOutlet weak var overlayTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overlayTableView.dataSource = self
        overlayTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = weekArray[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(weekArray.count)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let pinAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Pin") { (action, view, completionHandler) in
            completionHandler(true)
        }
        
        pinAction.image = UIImage(named: "pin")
        pinAction.backgroundColor = UIColor.gray
        
        let hideAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Hide") { (action, view, completionHandler) in
            completionHandler(true)
        }
        
        hideAction.image = UIImage(named: "hide")
        hideAction.backgroundColor = UIColor.darkGray
        
        let configuration = UISwipeActionsConfiguration(actions: [pinAction,hideAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Edit") { (action, view, completionHandler) in
            completionHandler(true)
        }
        
        editAction.image = UIImage(named: "edit")
        editAction.backgroundColor = UIColor.green
        
        let deleteAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Delete") { (action, view, completionHandler) in
            completionHandler(true)
        }
        
        deleteAction.image = UIImage(named: "trash")
        deleteAction.backgroundColor = UIColor.red
        
        let configuration = UISwipeActionsConfiguration(actions: [editAction,deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
        
    }
    


}
