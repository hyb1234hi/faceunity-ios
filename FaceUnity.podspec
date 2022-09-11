Pod::Spec.new do |spec|
  spec.ios.deployment_target = "9.0"
  spec.name         = 'FaceUnity'
  spec.version      = '1.0.0'
  spec.license      = 'MIT'
  spec.summary      = 'FaceUnity skin and body beautify'
  spec.homepage     = 'https://git.xiangmu.tech'
  spec.author       = 'FaceUnity'
  spec.source       = { :git => '', :tag => '#{spec.version}'}
  spec.subspec 'FaceUnity' do |fs|
    fs.source_files = 'FaceUnity/**/*.{h,m}'
    fs.resources = ['FaceUnity/items/**/*.{png,bundle,xib,strings}']
  end
  spec.subspec 'Utils' do |us|
    us.source_files = 'Utils/**/*.{h,m}' 
  end
  spec.requires_arc = true
  spec.static_framework = true
  spec.dependency 'AgoraRtcEngine_iOS'
  spec.dependency 'AGMCapturer_iOS'
  spec.dependency 'MJExtension'
  spec.dependency 'Nama', '7.2.0'
end
