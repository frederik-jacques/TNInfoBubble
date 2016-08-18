//
//  ViewController.swift
//  TNInfoBubble
//
//  Created by Frederik Jacques on 07/18/2016.
//  Copyright (c) 2016 Frederik Jacques. All rights reserved.
//

import UIKit
import TNInfoBubble

class StoryboardViewController: UIViewController, TNInfoBubbleViewDelegate {

  // MARK: Life-cycle methods
  @IBOutlet weak var infoBubble: TNInfoBubbleView!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
   
    self.title = "With Storyboards"
    
  }

  override func didReceiveMemoryWarning() {
    
    super.didReceiveMemoryWarning()
      
  }

  // MARK: IBAction methods
  @IBAction func showDefaultButtonTouched(sender: UIButton) {
    
    self.infoBubble.labelText = "Hello World"
    self.infoBubble.show()
    
  }
  
  @IBAction func showMultilineButtonTouched(sender: UIButton) {
    
    self.infoBubble.labelText = "Hello very big big big big big big big world"
    self.infoBubble.show()
    
  }
  
  @IBAction func showConfiguredButtonTouched(sender: UIButton) {
    
    var config = TNInfoBubbleConfiguration()
    config.backgroundColor = UIColor(red: 92/255.0,
                                     green: 184/255.0,
                                     blue: 92/255.0,
                                     alpha: 1.0)
    config.labelTextColor = .whiteColor()
    
    self.infoBubble.config = config
    self.infoBubble.labelText = "Hello World"
    self.infoBubble.show()
    
  }
  
  @IBAction func showButtonWithDelegateTouched(sender: UIButton) {
  
    self.infoBubble.delegate = self
    self.infoBubble.labelText = "Hello World"
    self.infoBubble.show()
        
  }
  
  // MARK: Delegate methods
  // MARK: TNInfoBubbleViewDelegate methods
  func didShowInfoBubble( infoBubble:TNInfoBubbleView ) {
    
    print("Did show info bubble")
    
  }

  func didHideInfoBubble( infoBubble:TNInfoBubbleView ) {
    
    print("Did hide info bubble")
    
  }
  
}

