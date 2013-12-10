Pod::Spec.new do |spec|

  spec.name     = 'iOS-Goodies'
  spec.version  = '0.0.1'
  spec.license  = 'MIT'
  spec.summary  = 'A collection of useful, yet hard to continually recreate componentspec. '
  spec.source   = { :git => 'https://github.com/premosystems/iOS-Goodies.git'}
  spec.requires_arc = true

  spec.ios.deployment_target = '6.0'

  spec.public_header_files = 'Classes/**/*.h'
  spec.source_files = 'Classes/**/*.{h,m}'
  
  spec.ios.resource_bundle = { 'iOS-Goodies-Resources' => 'Resources/**/*.*' }

end