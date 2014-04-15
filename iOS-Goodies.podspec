Pod::Spec.new do |spec|

  spec.name		= 'iOS-Goodies'
  spec.version	= '0.0.1'
  spec.license	= 'MIT'
  spec.summary	= 'A collection of useful, yet hard to continually recreate componentspec. '
  spec.source	= { :git => 'https://github.com/premosystems/iOS-Goodies.git'}
  spec.requires_arc = true

  spec.ios.deployment_target = '7.0'
 
  spec.resource = 'iOS-Goodies.podspec'
  
  spec.source_files = 'Classes/*.{h,m}'
  
  spec.subspec "Model" do |sp|
	  
  end
  
  spec.subspec "View" do |viewSpec|
	viewSpec.prefix_header_contents = '#import "RDVKeyboardAvoidingScrollView.h"', '#import "US2FormValidator.h"', '#import "IOGBlocks.h"', '#import <AssetsLibrary/AssetsLibrary.h>'
	viewSpec.source_files = 'Classes/View/*.{h,m}'
    
    viewSpec.ios.dependency 'iOS-Goodies/Controller/Blocks'
	viewSpec.ios.dependency 'MBProgressHUD'
	viewSpec.ios.dependency 'RDVKeyboardAvoiding' # https://github.com/robbdimitrov/RDVKeyboardAvoiding
	viewSpec.ios.dependency 'US2FormValidator', '~> 1.1.2'	# https://github.com/ustwo/US2FormValidator
	viewSpec.ios.dependency 'RSCategories', '~> 0.1' # https://github.com/reejosamuel/RSCategories
	viewSpec.ios.dependency 'UIAlertView+Blocks'
	viewSpec.ios.dependency 'UIActionSheet+Blocks'
	viewSpec.ios.dependency 'HexColors'
    viewSpec.ios.dependency 'MMDrawerController', '~> 0.5.2'
	viewSpec.ios.dependency 'BlurryModalSegue'

    viewSpec.ios.resource_bundle = { 'IOSGViewResources' => 'Resources/**/*.*' }
	viewSpec.ios.framework = 'AssetsLibrary'

	viewSpec.subspec "ViewCategories" do |categorySpec|
        categorySpec.ios.xcconfig = {'OTHER_LDFLAGS' => '-all_load'}
		categorySpec.source_files = 'Classes/View/Categories/*.{h,m}'
	end
  end
  
  spec.subspec "Controller" do |controllerSpecs|
	 controllerSpecs.source_files = 'Classes/Controller/IOGController.h'
     
     controllerSpecs.dependency 'OpenUDID'

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
			sp.ios.dependency 'CocoaLumberjack', '~>1.8.0'
			sp.ios.dependency 'iOS-Goodies/Controller/LumberjackHelpers'
		end
		
		controllerSpecs.subspec "LumberjackHelpers" do |sp|
            sp.ios.dependency 'LumberjackPrettyClassInformation'
			sp.prefix_header_contents = '#import "Lumberjack-Default-Log-Level.h"', '#import "PrettyClassInformationLogFormatter.h"'
			sp.source_files = 'Classes/Controller/LumberjackHelpers/*.{h,m}'
		end
		
		controllerSpecs.subspec "CoreLocation" do |sp|
			sp.prefix_header_contents = '#import <CoreLocation/CoreLocation.h>'	
            sp.source_files = 'Classes/Controller/CoreLocation/*.{h,m}'
			sp.ios.framework = 'CoreLocation'
		end
        
        controllerSpecs.subspec "CoreBluetooth" do |sp|
			sp.prefix_header_contents = '#import <CoreBluetooth/CoreBluetooth.h>'
			sp.source_files = 'Classes/Controller/CoreBluetooth/*.{h,m}'
            sp.ios.framework = 'CoreBluetooth'
		end
		
		controllerSpecs.subspec "Categories" do |sp|
            sp.resources = ["Classes/View/Categories/IOGPlaceholderImage.png"]
            sp.ios.xcconfig = {'OTHER_LDFLAGS' => '-all_load'}
			sp.source_files = 'Classes/Controller/Categories/*.{h,m}'
		end
        
        controllerSpecs.subspec "Blocks" do |sp|
			sp.source_files = 'Classes/Controller/Blocks/*.h'
            # sp.dependency 'BlocksKit', '~>2.0.0'
		end
        
        controllerSpecs.subspec "Twilio" do |sp|
			sp.source_files = 'Classes/Controller/Twilio/*.{h,m}'
            sp.prefix_header_contents = '#import "TwilioClient.h"'
            sp.dependency 'TwilioSDK'
		end
  end
end