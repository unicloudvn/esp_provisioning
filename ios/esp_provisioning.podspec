#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint esp_provisioning.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'esp_provisioning'
  s.version          = '0.0.1'
  s.summary          = 'Espressif BLE Provisioning '
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://tuanpm.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Tuan' => 'tuanpm@live.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
