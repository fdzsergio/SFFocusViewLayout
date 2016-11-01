Pod::Spec.new do |s|
  s.name             = "SFFocusViewLayout"
  s.version          = "3.1.0"
  s.summary          = "UICollectionViewLayout subclass with focused content."

  s.description      = <<-DESC
                          SFFocusViewLayout is a UICollectionViewLayout subclass 
                          for displaying focused content on UICollectionView which
                          is the largest cell of all.
                       DESC
                       
  s.homepage         = "https://github.com/fdzsergio/SFFocusViewLayout"
  s.screenshots      = "https://raw.githubusercontent.com/fdzsergio/SFFocusViewLayout/master/Screenshots/SFFocusViewLayout.gif"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Sergio Fernández" => "fdz.sergio@gmail.com" }
  s.source           = { :git => "https://github.com/fdzsergio/SFFocusViewLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fdzsergio'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/*.{h,swift}'
  s.frameworks = 'UIKit'
  
  s.ios.deployment_target = '8.0'
end
