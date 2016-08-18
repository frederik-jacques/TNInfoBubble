//
//  MenuTableViewController.swift
//  TNInfoBubble
//
//  Created by Frederik Jacques on 16/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

  // MARK: - Life-cycle methods
  override func viewDidLoad() {

    super.viewDidLoad()
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    let backItem = UIBarButtonItem()
    backItem.title = "Back"
    navigationItem.backBarButtonItem = backItem
    
  }
  
  // MARK: - Public methods
  
  // MARK: - Private methods
  
  // MARK: - Accessor methods
  
  // MARK: - Delegate methods
  
  // MARK: - NSNotification methods
  
  // MARK: - KVO methods

}
