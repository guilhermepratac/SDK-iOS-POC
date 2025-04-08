Pod::Spec.new do |s|
    s.name             = 'SDK-IOS-POC'
    s.version          = '1.0.3'
    s.summary          = 'A short description of SDK-IOS-POC.'
    s.homepage         = 'https://github.com/guilhermepratac/SDK-iOS-POC'
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'Quick Bird' => 'guilhermepratacosta@outlook.com.br' }
    s.source           = { :git => 'https://github.com/guilhermepratac/SDK-iOS-POC.git', :tag => s.version.to_s }
    s.ios.deployment_target = '13.0'
    s.swift_version = '6.0'
    s.source_files = 'Sources/SDK-IOS-POC/**/*'
end