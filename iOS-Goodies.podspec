Pod::Spec.new do |spec|

  spec.name		= 'iOS-Goodies'
  spec.version	= '0.0.1'
  spec.license	= 'MIT'
  spec.summary	= 'A collection of useful, yet hard to continually recreate componentspec. '
  spec.source	= { :git => 'https://github.com/premosystems/iOS-Goodies.git'}
  spec.requires_arc = true

  spec.ios.deployment_target = '7.0'
 
  spec.resource = 'iOS-Goodies.podspec'
  
  spec.source_files = 'Classes/iOS-Goodies.{h,m}'
  
  spec.subspec "Model" do |sp|
	  
  end
  
  spec.subspec "View" do |viewSpec|
	viewSpec.prefix_header_contents = '#import "RDVKeyboardAvoidingScrollView.h"', '#import "US2FormValidator.h"'
	viewSpec.source_files = 'Classes/View/*.{h,m}'
	viewSpec.ios.dependency 'MBProgressHUD'
	viewSpec.ios.dependency 'RDVKeyboardAvoiding' # https://github.com/robbdimitrov/RDVKeyboardAvoiding
	viewSpec.ios.dependency 'US2FormValidator', '~> 1.1.2'	# https://github.com/ustwo/US2FormValidator
	viewSpec.ios.dependency 'RSCategories', '~> 0.1' # https://github.com/reejosamuel/RSCategories
	viewSpec.ios.dependency 'UIAlertView+Blocks'
	viewSpec.ios.dependency 'UIActionSheet+Blocks'
	viewSpec.ios.dependency 'HexColors'
	viewSpec.ios.resource_bundle = { 'IOSGViewResources' => 'Resources/**/*.*' }
	
	viewSpec.subspec "ViewCategories" do |categorySpec|
		categorySpec.source_files = 'Classes/View/Categories/*.{h,m}'
	end
  end
  
  spec.subspec "Controller" do |controllerSpecs|
	
		controllerSpecs.subspec "AWS" do |sp|
			sp.subspec "S3" do |s3|
				s3.source_files = 'Classes/Controller/AWS/S3/*.{h,m}'
				s3.ios.dependency 'AWSiOSSDK/S3', '~>1.7.1'
				s3.ios.dependency 'CocoaLumberjack', '~>1.8.0'
				s3.ios.dependency 'iOS-Goodies/Controller/LumberjackHelpers'
			end
		end
		
		controllerSpecs.subspec "EnvironmentConfig" do |sp|
			sp.source_files = 'Classes/Controller/EnvironmentConfig/*.{h,m}'
			sp.dependency 'iOS-Goodies/Controller/Categories'
			sp.ios.framework = 'CoreLocation'
			s3.ios.dependency 'CocoaLumberjack', '~>1.8.0'
			s3.ios.dependency 'iOS-Goodies/Controller/LumberjackHelpers'
		end
		
		controllerSpecs.subspec "LumberjackHelpers" do |sp|
			s3.prefix_header_contents = '#import "Lumberjack-Default-Log-Level.h"'
			sp.source_files = 'Classes/Controller/LumberjackHelpers/*.{h,m}'
		end
		
		controllerSpecs.subspec "LocationManager" do |sp|
			sp.prefix_header_contents = '#import <CoreLocation/CoreLocation.h>'
			sp.source_files = 'Classes/Controller/LocationManager/*.{h,m}'
			sp.ios.framework = 'CoreLocation'
		end
		
		controllerSpecs.subspec "Categories" do |sp|
			sp.source_files = 'Classes/Controller/Categories/*.{h,m}'
		end
  end
end