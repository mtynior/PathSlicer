Pod::Spec.new do |s|

  s.name         = "PathSlicer"
  s.version      = "1.0.0"
  s.summary      = "Returns information about Nancy style path strings"

  s.homepage     = "https://github.com/mtynior/PathSlicer"
  s.license      = "MIT"
  
  s.author             = { "Michał Tynior" => "mtynior@gmail.com" }
  s.social_media_url   = "http://twitter.com/mtynior"

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source       = { :git => "https://github.com/mtynior/PathSlicer.git", :tag =>  s.version }
  s.source_files  = "Source/**/*.swift"
 
  s.requires_arc = true

end
