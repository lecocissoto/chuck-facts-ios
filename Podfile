platform :ios, '9.0'
use_frameworks!

target 'Chuck Facts' do
    pod 'RxSwift',    '~> 4.3.1'
    pod 'RxCocoa',    '~> 4.3.1'
    pod 'ReachabilitySwift',	'~> 4.3.0'
    pod 'RxDataSources', '~> 3.0'
end

target 'Chuck FactsTests' do
    pod 'RxSwift', '> 3.0'
    pod 'RxCocoa', '> 3.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end
