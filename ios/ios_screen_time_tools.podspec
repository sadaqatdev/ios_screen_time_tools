Pod::Spec.new do |s|
  s.name             = 'ios_screen_time_tools'
  s.version          = '0.0.14'
  s.summary          = 'iOS Screen Time Tools Flutter plugin'
  s.description      = 'A Flutter plugin for iOS Screen Time management'
  s.homepage         = 'https://github.com/yourusername/ios_screen_time_tools'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'your-email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '15.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
