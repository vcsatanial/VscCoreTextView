Pod::Spec.new do |spec|
  spec.name             = 'VscCoreTextView'
  spec.ios.deployment_target = '8.0'
  spec.version          = '1.0.2'
  spec.summary          = '富文本输入框'
  spec.description      = <<-DESC
                       支持富文本输入的TextView
                       DESC
  spec.homepage         = 'https://github.com/vcsatanial/VscCoreTextView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'VincentSatanial' => '116359398@qq.com' }
  spec.source           = { :git => 'https://github.com/vcsatanial/VscCoreTextView.git', :tag => spec.version }
  
  spec.source_files = 'VscCoreTextView/*.{h,m}'
  spec.requires_arc = true
end
