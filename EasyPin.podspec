#
# Be sure to run `pod lib lint EasyPin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyPin'
  s.version          = '0.1.0'
  s.summary          = 'EasyPin is a SwiftUI based customizable pin code generator'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  EasyPin is a pod written in SwiftUI which lets you create PIN code and keypad easily with customisation according to your own liking.
                       DESC

  s.homepage         = 'https://github.com/Fahad Shafiq/EasyPin'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Fahad Shafiq' => 'fahadshafiq48@gmail.com' }
  s.source           = { :git => 'https://github.com/fahadshafiq48/EasyPin.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'EasyPin/Classes/**/*'
  s.swift_version = '5.0'
  
  # s.resource_bundles = {
  #   'EasyPin' => ['EasyPin/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
