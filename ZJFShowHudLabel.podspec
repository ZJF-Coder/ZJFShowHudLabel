#
# Be sure to run `pod lib lint ZJFShowHudLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZJFShowHudLabel'
  s.version          = '0.1.0'
  s.summary          = 'Swift或者Objective-C下使用的toast小组件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        仅仅提供一个showInfo的方法：可定义文本+显示高度(填0则为默认高度)+显示秒数
                       DESC

  s.homepage         = 'https://github.com/ZJF-Coder/ZJFShowHudLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wwyy' => '505228178@qq.com' }
  s.source           = { :git => 'https://github.com/ZJF-Coder/ZJFShowHudLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZJFShowHudLabel/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZJFShowHudLabel' => ['ZJFShowHudLabel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
