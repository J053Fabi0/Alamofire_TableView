//
//  ViewController.swift
//  AlamofireTableView
//
//  Created by Jose Fabio_ on 07/04/17.
//  Copyright © 2017 com.yoyomero. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var actorsArray = [AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://thecodeeasy.com/test/swiftjson.json").responseJSON { response in
            
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let innerDict = dict["actors"]{
                    self.actorsArray = innerDict as! [AnyObject]
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        let title = actorsArray[indexPath.row]["title"]
        let category = actorsArray[indexPath.row]["category"]
        cell.categoryLabel.text = category as? String
        cell.titleLabel.text = title as? String
        
        return cell
    }

    

}

