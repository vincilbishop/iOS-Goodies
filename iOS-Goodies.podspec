Pod::Spec.new do |s|
  s.name     = 'iOS-Goodies'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'A collection of useful, yet hard to continually recreate components. '
  s.source   = { :git => 'https://github.com/premosystems/iOS-Goodies.git'}
  s.requires_arc = true

  s.ios.deployment_target = '6.0'

  s.public_header_files = 'Classes/*.{h,m}'
  s.source_files = 'Classes/*.*'
  
  end