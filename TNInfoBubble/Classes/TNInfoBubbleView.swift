//
//  TNInfoBubbleView.swift
//  Pods
//
//  Created by Frederik Jacques on 18/07/16.
//
//

import UIKit

/**
 The TNInfoBubbleViewDelegate protocol provides you with 2 methods if you want
 to get notified when the bubble is shown or hidden.
 */
public protocol TNInfoBubbleViewDelegate {
  
  func didShowInfoBubble( infoBubble:TNInfoBubbleView )
  func didHideInfoBubble( infoBubble:TNInfoBubbleView )
  
}

/**
 The TNInfoBubbleConfiguration struct is used by the TNInfoBubbleView class to configure all its views and give it a certain looks.
 
 If you don't set the config struct sensible defaults will be used.
 
 */
public struct TNInfoBubbleConfiguration {
  
  /// The background color of the view, defaults to black.
  public var backgroundColor:UIColor
  
  /// The corner radius of the view, defaults to 3.
  public var cornerRadius:CGFloat
  
  /// The font used for the info label inside the bubble, defaults to the system font.
  public var labelFont:UIFont
  
  /// The color for the info label, defaults to white.
  public var labelTextColor:UIColor
  
  /// The text alignment for the info label, defaults to .Center
  public var labelTextAlignment:NSTextAlignment
  
  /// The line break mode for the info label, defaults to .ByWordWrapping
  public var labelLineBreakMode:NSLineBreakMode
  
  /// The number of lines that the info label can display, defaults to 0.
  public var labelNumberOfLines:Int
  
  /// Does the infobubble have to hide itself automatically after being shown? Defaults to `true`.
  public var autoHide:Bool
  
  /// The amount of seconds that the view is visible to the user, before it hides itself. Defaults to 0.3 seconds.
  public var numberOfSecondsToAutoHide:NSTimeInterval
  
  /// Remove the bubble from the superview's view hierarchy when the view gets hidden. Defaults to `false`
  public var autoRemoveFromSuperView:Bool
  
  /**
   Create a default configuration instance.
   
   - returns: `TNInfoBubbleConfiguration` instance
   */
  public init(){
    
    self.backgroundColor = UIColor( red: 28/255.0,
                                    green: 13/255.0,
                                    blue: 13/255.0,
                                    alpha: 1.0)
    self.cornerRadius = 3
    
    self.labelFont = UIFont.systemFontOfSize(14)
    self.labelTextColor = UIColor.whiteColor()
    self.labelTextAlignment = NSTextAlignment.Center
    self.labelLineBreakMode = NSLineBreakMode.ByWordWrapping
    self.labelNumberOfLines = 0
    
    self.autoHide = true
    self.numberOfSecondsToAutoHide = 3
    
    self.autoRemoveFromSuperView = false
    
  }
  
  /*
   Create a configuration instance to be used with the `TNInfoBubbleView`.
   
   - parameter backgroundColor:           the background color for the view
   - parameter cornerRadius:              the corner radius for the view
   - parameter labelFont:                 the font for the info label
   - parameter labelTextColor:            the color for the info label
   - parameter labelTextAlignment:        the text alignment for the info label
   - parameter labelLineBreakMode:        the line break mode for the info label
   - parameter labelNumberOfLines:        the number of lines that the info label can display
   - parameter autoHide:                  does the infobubble have to hide itself automatically after being shown
   - parameter numberOfSecondsToAutoHide: the amount of seconds that the view is visible to the user, before it hides itself.
   - parameter autoRemoveFromSuperView:   remove the bubble from the superview's view hierarchy when the view gets hidden
   
   - returns: `TNInfoBubbleConfiguration` instance
   */
  public init( backgroundColor:UIColor,
               cornerRadius:CGFloat,
               labelFont:UIFont,
               labelTextColor:UIColor,
               labelTextAlignment:NSTextAlignment,
               labelLineBreakMode:NSLineBreakMode,
               labelNumberOfLines:Int,
               autoHide:Bool,
               numberOfSecondsToAutoHide:NSTimeInterval,
               autoRemoveFromSuperView:Bool){
    
    self.backgroundColor = backgroundColor
    self.cornerRadius = cornerRadius
    self.labelFont = labelFont
    self.labelTextColor = labelTextColor
    self.labelTextAlignment = labelTextAlignment
    self.labelLineBreakMode = labelLineBreakMode
    self.labelNumberOfLines = labelNumberOfLines
    self.autoHide = autoHide
    self.numberOfSecondsToAutoHide = numberOfSecondsToAutoHide
    self.autoRemoveFromSuperView = autoRemoveFromSuperView
    
  }
  
}

public typealias TNInfoBubbleCompletionHandler = () -> ()

public class TNInfoBubbleView: UIView {

  // MARK: IBOutlets
  
  // MARK: Properties
  private var infoLabel:UILabel!
  
  /**
   Set the text of the label. If you set this property, the label will automatically take the value you passed in.
   */
  public var labelText:String = "" {
    
    didSet {
      
      self.infoLabel.text = self.labelText
      
    }
    
  }
  
  /// Set your own object as the delegate of the bubble if you want to be updated when the view is shown or hidden.
  public var delegate:TNInfoBubbleViewDelegate?
  
  /**
   Set a configuration struct to change the appearance of the bubble.
   If you set this property, all changes will be updated automatically.
   */
  public var config:TNInfoBubbleConfiguration {
    
    didSet {
      
      self.configure()
      
    }
    
  }
  
  /// Block to inform you when the bubble is hidden. Use this if you don't want to use the delegate.
  public var completionHandler:TNInfoBubbleCompletionHandler?
  
  // MARK: Life-cycle methods
  
  /**
   Create a new info bubble instance, the bubble will be configured with sensible defaults.
   
   - returns: TNInfoBubbleView instance
   */
  public init(){
    
    self.config = TNInfoBubbleConfiguration()
    
    super.init( frame: CGRectZero)
    
    self.setup()
    
  }
  
  override public init(frame: CGRect) {
    
    self.config = TNInfoBubbleConfiguration()
    
    super.init(frame: frame)
    
    self.setup()
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    
    self.config = TNInfoBubbleConfiguration()
    
    super.init(coder: aDecoder)
    
    self.setup()
    
  }
  
  deinit {
    
  }

  // MARK: Public methods
  
  /// Show the bubble with a duration of 0.3 seconds
  public func show(){
    
    self.show( duration: 0.3,
               delay: 0,
               easing: .CurveEaseInOut)
    
  }
  
  /**
   Show the bubble
   
   - parameter duration: how long (in seconds) does it take to show the bubble
   */
  public func show( duration duration:NSTimeInterval ){
    
    self.show( duration: duration,
               delay: 0,
               easing: .CurveEaseInOut)
    
  }
  
  /**
   Show the bubble
   
   - parameter duration: how long (in seconds) does it take to show the bubble
   - parameter delay:    how long (in seconds) before the bubble shows
   */
  public func show( duration duration:NSTimeInterval, delay:NSTimeInterval ){
    
    self.show( duration: duration,
               delay: delay,
               easing: .CurveEaseInOut)
    
  }
  
  /**
   Show the bubble
   
   - parameter duration: how long (in seconds) does the bubble need to be visible
   - parameter delay:    how long (in seconds) before the bubble shows
   - parameter easing:   the timing function to be used for the animation
   */
  public func show( duration duration :NSTimeInterval,
                             delay:NSTimeInterval,
                             easing:UIViewAnimationOptions ){
    
    UIView.animateWithDuration( duration,
                                delay: delay,
                                options: easing,
                                animations: {
                                  
      self.hidden = false
      self.alpha = 1
      
      }) { (done) in
        
        if done && self.config.autoHide {
          
          self.delegate?.didShowInfoBubble( self )
          
          self.hide(duration: 0.3,
                    delay: self.config.numberOfSecondsToAutoHide )
          
        }
        
    }
    
  }
  
  /**
   Hide the bubble
   */
  public func hide() {
    
    self.hide(duration: 0.3,
              delay: 0,
              easing: .CurveEaseInOut)
    
  }
  
  /**
   Hide the bubble
   
   - parameter duration: how long (in seconds) does it take to hide the bubble
   - parameter delay:    how long (in seconds) before the bubble hides
   */
  public func hide( duration duration:NSTimeInterval, delay:NSTimeInterval ) {
    
    self.hide(duration: duration,
              delay: delay,
              easing: .CurveEaseInOut)
    
  }
  
  /**
   Hide the bubble
   
   - parameter duration: how long (in seconds) does it take to hide the bubble
   - parameter delay:    how long (in seconds) before the bubble hides
   - parameter easing:   the timing function to be used for the animation
   */
  public func hide( duration duration:NSTimeInterval,
                             delay:NSTimeInterval,
                             easing:UIViewAnimationOptions ){
    
    UIView.animateWithDuration( duration,
                                delay: delay,
                                options: easing,
                                animations: {

      self.alpha = 0
      
    }) { ( done ) in
      
      if done {
        
        self.hidden = true
        
        self.delegate?.didHideInfoBubble( self )
        
        self.completionHandler?()
        
        if self.config.autoRemoveFromSuperView {
          
          self.removeFromSuperview()
          
        }
        
      }
      
    }
    
  }

  // MARK: Private methods
  private func setup(){
  
    self.translatesAutoresizingMaskIntoConstraints = false
  
    self.configureView()
    
    self.createLabelView()
    self.addConstraints()
    
  }
  
  private func configure() {
    
    configureView()
    configureLabelView()
    
  }
  
  private func configureView(){
    
    self.hidden = true
    self.alpha = 0
    
    self.layer.cornerRadius = self.config.cornerRadius
    self.backgroundColor = self.config.backgroundColor
    
  }
  
  private func createLabelView() {
    
    self.infoLabel = UILabel( frame: CGRectZero )
    self.infoLabel.translatesAutoresizingMaskIntoConstraints = false
    
    self.configureLabelView()
    
    self.addSubview( self.infoLabel )
    
  }
  
  private func configureLabelView() {
    
    self.infoLabel.numberOfLines = self.config.labelNumberOfLines
    self.infoLabel.lineBreakMode = self.config.labelLineBreakMode
    
    self.infoLabel.font = self.config.labelFont
    self.infoLabel.textColor = self.config.labelTextColor
    self.infoLabel.textAlignment = self.config.labelTextAlignment
    self.infoLabel.text = self.labelText
    
  }
  
  private func addConstraints(){
    
    var constraints = [NSLayoutConstraint]()
    constraints += self.addInfoLabelConstraints()
    
    NSLayoutConstraint.activateConstraints( constraints )
    
  }
  
  private func addInfoLabelConstraints() -> [NSLayoutConstraint] {
    
    let views = [
      "superView" : self,
      "infoLabel" : self.infoLabel
    ]
    
    let infoLabelHorizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
      "H:[superView]-(<=1)-[infoLabel]",
      options: NSLayoutFormatOptions.AlignAllCenterY,
      metrics: nil,
      views: views )
    
    let infoLabelHorizontalConstraints2 = NSLayoutConstraint.constraintsWithVisualFormat(
      "H:|-[infoLabel]-|",
      options: NSLayoutFormatOptions(),
      metrics: nil,
      views: views )
    
    let infoLabelVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
      "V:[superView]-(<=1)-[infoLabel]",
      options: NSLayoutFormatOptions.AlignAllCenterX,
      metrics: nil,
      views: views )
    
    let infoLabelVerticalConstraints2 = NSLayoutConstraint.constraintsWithVisualFormat(
      "V:|-[infoLabel]-|",
      options: NSLayoutFormatOptions(),
      metrics: nil,
      views: views )
    
    var constraints = [NSLayoutConstraint]()
    constraints += infoLabelHorizontalConstraints
    constraints += infoLabelHorizontalConstraints2
    constraints += infoLabelVerticalConstraints
    constraints += infoLabelVerticalConstraints2
    
    return constraints
    
  }
  
  // MARK: Delegate methods
  
  // MARK: NSNotification methods
  
  // MARK: KVO methods

}
