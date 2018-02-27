//
//  MasterViewController.swift
//  WorkWithCoreData
//
//  Created by ĐỖ HOÀNG VŨ on 2/27/18.
//  Copyright © 2018 ĐỖ HOÀNG VŨ. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(sender: UIBarButtonItem) {
        showAlert(vc: self, title: "Add New", message: "")
    }
    
    func showAlert(vc: UIViewController, title:String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { [unowned self](result : UIAlertAction) -> Void in
            let entity = Entity(context: AppDelegate.context)
            entity.studentName = alertController.textFields?.first?.text
            DataServices.shared.studentNames.append(entity)
            AppDelegate.saveContext()
            self.tableView.reloadData()
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "add new text"
        }
        
        alertController.addAction(okAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
   
}
// MARK: - UITableViewDataSource

extension MasterViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.shared.studentNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureCell(cell: cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: IndexPath) {
        cell.textLabel?.text = DataServices.shared.studentNames[forRowAtIndexPath.row].studentName
    }
}
