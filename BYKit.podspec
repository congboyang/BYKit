@version = "1.0.1"

Pod::Spec.new do |s| 
s.name = "BYKit" 
s.version = @version 
s.summary = "基类" 
s.description = "测试" 
s.homepage = "https://github.com/congboyang/BYKit"
s.license = { :type => 'MIT', :file => 'LICENSE' } 
s.author = { "sooncong" => "sooncong_sz@163.com" } 
s.ios.deployment_target = '8.0' 
s.source = { :git => "https://github.com/congboyang/BYKit.git",:tag => "v#{s.version}" } 
s.source_files = 'BYKit/**/*.{h,m}' 
s.requires_arc = true 
s.framework = "Foundation","UIKit" 
s.dependency "pop"    #所依赖的第三方库，没有就不用写
end