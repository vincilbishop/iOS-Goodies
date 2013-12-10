Pod::Spec.new do |spec|

  spec.name     = 'iOS-Goodies'
  spec.version  = '0.0.1'
  spec.license  = 'MIT'
  spec.summary  = 'A collection of useful, yet hard to continually recreate componentspec. '
  spec.source   = { :git => 'https://github.com/premosystems/iOS-Goodiespec.git'}
  spec.requires_arc = true

  spec.iospec.deployment_target = '6.0'

  spec.public_header_files = 'Classes/**/*.h'
  spec.source_files = 'Classes/**/*.{h,m}'
  spec.prefix_header_contents = '#import "iOS-Goodiespec.h"'
  
  # spec.ios.resource_bundle = { 'iOS-Goodies-Resources' => 'Resources/**/*.*' }

end