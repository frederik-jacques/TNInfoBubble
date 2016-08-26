#
# Be sure to run `pod lib lint TNInfoBubble.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TNInfoBubble'
  s.version          = '1.0.1'
  s.summary          = 'TNInfoBubble is a customizable info bubble like the one being used in the Prisma app.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This Swift component creates an info bubble which is highly customizable. Out of the box it looks like the info bubble being used in the Prisma app.
The component can be used within Storyboards or can be created via code.

More information is available in the README.
                       DESC

  s.homepage         = 'https://github.com/frederik-jacques/TNInfoBubble'
  s.screenshots     = 'https://cl.ly/3z02331F3y3B/tninfobubble.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Frederik Jacques' => 'frederik@the-nerd.be' }
  s.source           = { :git => 'https://github.com/frederik-jacques/TNInfoBubble.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thenerd_be'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TNInfoBubble/Classes/**/*'

end
