

Pod::Spec.new do |s|

  # Masonry
  s.name         = "SDToolView"
  s.version      = "0.0.1"
  s.summary      = "SDToolView让搭建设置界面 发布界面 更简单"

  s.homepage     = "https://github.com/GSmoke/SDToolView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "zhl" => "yeah_yh@163.com" }

  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/GSmoke/GSmoke/SDToolView.git", :tag => s.version }
  #  s.source       = { :git => "http://EXAMPLE/SDToolView.git", :tag => "#{s.version}" }

  s.source_files  = "SDToolView/*.{h,m}"

  s.requires_arc = true

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # s.dependency "JSONKit", "~> 1.4"

end
