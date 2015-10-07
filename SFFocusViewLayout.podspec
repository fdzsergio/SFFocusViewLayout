Pod::Spec.new do |s|
  s.name             = "SFFocusViewLayout"
  s.version          = "1.0.1"
  s.summary          = "UICollectionViewLayout with focused content."

  s.description      = <<-DESC
                        UICollectionViewLayout subclass for displaying focused content 
                        on UICollectionView which is the largest cell of all.
                       DESC

  s.homepage         = "https://github.com/fdzsergio/SFFocusViewLayout"
  # s.screenshots     = "https://github.com/fdzsergio/SFFocusViewLayout/gifs/example.gif",   
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Sergio Fernández" => "fdz.sergio@gmail.com" }
  s.source           = { :git => "https://github.com/fdzsergio/SFFocusViewLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fdzsergio'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'SFFocusViewLayout/Classes/**/*'
  s.frameworks = 'UIKit'
end
