
Pod::Spec.new do |s|

  s.name         = "JPSpamGestureRecognizer"
  s.version      = "0.1"
  s.summary      = "UIGestureRecognizer that detects rapid tapping"

  s.homepage     = "https://github.com/Jpoliachik/JPSpamGestureRecognizer"
  s.license      = "Apache"
  s.author             = { "Justin Poliachik" => "jpoliachik@gmail.com" }

  s.platform     = :ios
  s.ios.deployment_target = "5.0"

  s.source       = { :git => "https://github.com/Jpoliachik/JPSpamGestureRecognizer.git", :tag => "0.1" }
  s.source_files  = "JPSpamGestureRecognizer"
  s.requires_arc = true
end
