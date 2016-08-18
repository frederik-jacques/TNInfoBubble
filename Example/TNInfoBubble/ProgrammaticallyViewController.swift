//
//  ProgrammaticallyViewController.swift
//  TNInfoBubble
//
//  Created by Frederik Jacques on 16/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import TNInfoBubble

class ProgrammaticallyViewController: UIViewController {
  
  var bubble:TNInfoBubbleView!
  
  // MARK: - Life-cycle methods
  override func viewDidLoad() {
  
    super.viewDidLoad()
    
    self.createBubble()
    self.addConstraintsToBubble()
    
  }
  
  override func didReceiveMemoryWarning() {
    
    super.didReceiveMemoryWarning()
    
  }
  
  // MARK: - Public methods
  
  // MARK: - Private methods
  private func createBubble() {
    
    var config = TNInfoBubbleConfiguration()
    config.autoRemoveFromSuperView = true
    
    self.bubble = TNInfoBubbleView()
    self.bubble.config = config
    self.view.addSubview( self.bubble )
    
  }
  
  private func addConstraintsToBubble() {
    
    self.bubble.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 100).active = true
    self.bubble.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 0).active = true
    
  }
  
  // MARK: - IBAction methods
  @IBAction func showBubbleTouched(sender: UIButton) {
    
    self.bubble.labelText = "Hello World"
    self.bubble.completionHandler = { 
    
      print("The bubble completion handler")
      
    }
    
    self.bubble.show()
    
  }
  
  // MARK: - Accessor methods
  
  // MARK: - Delegate methods
  
  // MARK: - NSNotification methods
  
  // MARK: - KVO methods

}
