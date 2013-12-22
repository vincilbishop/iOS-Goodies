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
  spec.resource = 'iOS-Goodies.podspec'
  spec.prefix_header_contents = '#import "RDVKeyboardAvoidingScrollView.h"', '#import "US2FormValidator.h"'
  
  spec.ios.resource_bundle = { 'IOSGoodiesResources' => 'Resources/**/*.*' }
  
#  spec.ios.dependency 'BSModalPickerView' # https://github.com/subdigital/BSModalPickerView
  spec.ios.dependency 'MBProgressHUD'
  spec.ios.dependency 'RDVKeyboardAvoiding' # https://github.com/robbdimitrov/RDVKeyboardAvoiding
  spec.ios.dependency 'US2FormValidator', '~> 1.1.2'    # https://github.com/ustwo/US2FormValidator
  spec.ios.dependency 'RSCategories', '~> 0.1' # https://github.com/reejosamuel/RSCategories
  spec.ios.dependency 'UIAlertView+Blocks'
  spec.ios.dependency 'UIActionSheet+Blocks'
#  spec.ios.dependency 'ELCTextFieldCell', '~> 0.2.0'    # https://github.com/B-Sides/ELCTextFieldCell
#  spec.ios.dependency 'KIPullToReveal', '~> 0.0.1'      # https://github.com/kimar/KIPullToReveal


end