Pod::Spec.new do |s|

  s.name         = "XCPresentation"
  s.version      = "2.0.2"
  s.summary      = "presentation"

  s.description  = "presentation自定义转场样式的封装"

  s.homepage     = "https://github.com/fanxiaocong/XCPresentation"

  s.license      = "MIT"


  s.author       = { "樊小聪" => "1016697223@qq.com" }


  s.source       = { :git => "https://github.com/fanxiaocong/XCPresentation.git", :tag => s.version }


  s.source_files  = "XCPresentation/**/*", "XCPresentation/*"
  s.requires_arc  = true
  s.platform     = :ios, "9.0"

end


