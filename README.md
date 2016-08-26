# TNInfoBubble

[![CI Status](http://img.shields.io/travis/Frederik Jacques/TNInfoBubble.svg?style=flat)](https://travis-ci.org/Frederik Jacques/TNInfoBubble)
[![Version](https://img.shields.io/cocoapods/v/TNInfoBubble.svg?style=flat)](http://cocoapods.org/pods/TNInfoBubble)
[![License](https://img.shields.io/cocoapods/l/TNInfoBubble.svg?style=flat)](http://cocoapods.org/pods/TNInfoBubble)
[![Platform](https://img.shields.io/cocoapods/p/TNInfoBubble.svg?style=flat)](http://cocoapods.org/pods/TNInfoBubble)

![Header image](https://cl.ly/380H0y290f21/tninfobubble.gif)

# What
TNInfoBubble is a component written in Swift to create a Prisma-like info bubble.  The looks of the info bubble can be changed.
It works with Storyboards & code.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

TNInfoBubble is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TNInfoBubble"
```

# How to use

## Storyboards
1. Drag a UIView on your scene
2. Go to the Identity Inspector and change the class to `TNInfoBubbleView`
3. Add constraints to position the bubble
4. Create an `IBOutlet` so you can reference the bubble in your code.
5. Call one of the `show()` methods

## Programmatically

1. Create an instance of `TNInfoBubbleView`
2. Add the view to your view hierarchy & add constraints
3. Call one of the show methods

## Configuration
Out of the box this component uses the same style as the info bubble in the Prisma app (black background, white text color & 3px of corner radius).  
It is possible to change these settings.

1. Create an instance of the `TNInfoBubbleConfiguration` struct
2. Change the properties you want
3. Pass the struct instance to the `config` property of the `TNInfoBubbleView` instance

```
var config = TNInfoBubbleConfiguration()
config.autoRemoveFromSuperView = true
    
self.bubble.config = config
```

| Property                             | Explanation |
| ------------------------------- | -----------:|
| backgroundColor       		  | The background color of the view. Default: black
| cornerRadius   					| The corner radius of the view. Default: 3px
| labelFont                 		| The font of the info label. Default: System font 14pt
| labelTextColor     		        | The text color of the info label. Default: white
| labelTextAlignment      			| The text alignment of the info label. Default: centered
| labelLineBreakMode       		    | The wrapping mode of the info label. Default: word
| labelNumberOfLines            	| The number of lines that the info label can show. Default: 0
| autoHide                 			| Autohide the info bubble. Default: true
| numberOfSecondsToAutoHide      	| The number of seconds before the info bubbles hides itself. Default: 3
| autoRemoveFromSuperView        	| Remove the view from the superviews view hierarchy. Default: false

### Delegate
If you want to be updated when the bubble is shown or hidden, you can set your own object as the delegate by conforming to the `TNInfoBubbleViewDelegate` protocol.

```
self.infoBubble.delegate = self
...

// MARK: TNInfoBubbleViewDelegate methods
func didShowInfoBubble( infoBubble:TNInfoBubbleView ) {

	print("Did show info bubble")

}

func didHideInfoBubble( infoBubble:TNInfoBubbleView ) {

	print("Did hide info bubble")

}
```

### Completion block
If you dont want to use delegates, you can also use the `completionHandler` property and set your own callback.

```
self.infoBubble.completionHandler = {
  print("Completed")
}
```

## Author

Frederik Jacques, frederik@the-nerd.be
* [Blog](https://the-nerd.be)
* [Twitter](https://www.twitter.com/thenerd_be)

## License

TNInfoBubble is available under the MIT license. See the LICENSE file for more info.
