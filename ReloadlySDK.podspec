#
# Be sure to run `pod lib lint ReloadlyAuthentication.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReloadlySDK'
  s.version          = '1.0.1'
  s.summary          = 'The Reloadly SDK to easily work with Reloadly Services'



  s.description      = <<-DESC
The Reloadly SDK for iOS enables iOS developers to easily work with Reloadly Services and build scalable solutions. You can get started in minutes using Pods or manualy put the source to your workspace.
                       DESC

  s.homepage         = 'https://github.com/Reloadly/reloadly-sdk-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '4taras4' => '4taras4@gmail.com' }
  s.source           = { :git => 'https://github.com/Reloadly/reloadly-sdk-ios.git', :tag => s.version.to_s }
  s.swift_version = ['4.2', '5.0']

  s.ios.deployment_target = '10.0'
  s.source_files = 'ReloadlySDK/Classes/**/*'

  s.default_subspec = 'Airtime'

  s.subspec 'Airtime' do |co|
      co.source_files  = "ReloadlySDK/Classes/**/**/*.swift"
  end

  s.subspec 'Authentication' do |co|
      co.source_files  = "ReloadlySDK/Classes/ReloadlyAuthentication/**/*.swift"
  end

end
