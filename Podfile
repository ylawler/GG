# Uncomment the next line to define a global platform for your project
platform :ios, '14.2'

target 'GG' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

# Pods for GG
# add the Firebase pod for Google Analytics
pod 'Firebase/Analytics'
pod 'Firebase/Database'
pod 'Firebase/Auth'

  target 'GGTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GGUITests' do
    # Pods for testing
  end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.2'
  end
 end
end

end


