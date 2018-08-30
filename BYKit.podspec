@version = "1.0.0"

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
s.source_files = 'BYKit/Controller/*.{h,m}' 
s.source_files = 'BYKit/Config/*.{h,m}' 
s.source_files = 'BYKit/Model/*.{h,m}' 
s.source_files = 'BYKit/ViewAdapter/*.{h,m}' 
s.source_files = 'BYKit/Tool/AppleSystemService/*.{h,m}' 
s.source_files = 'BYKit/Tool/DefaultNotificationCenter/*.{h,m}' 
s.source_files = 'BYKit/View/ShowLoadingView/*.{h,m}' 
s.source_files = 'BYKit/View/Cell/CollectionViewClass/*.{h,m}' 
s.source_files = 'BYKit/View/Cell/TableViewClass/*.{h,m}' 
s.source_files = 'BYKit/View/CollectionView/*.{h,m}' 
s.source_files = 'BYKit/Category/UIFont+Category/*.{h,m}' 
s.source_files = 'BYKit/Category/NSObject+Category/*.{h,m}' 
# s.source_files = 'BYKit/Category/UIButton+Category/*.{h,m}' 
s.source_files = 'BYKit/Category/UIColor+Category/*.{h,m}' 
s.source_files = 'BYKit/Category/UIImage+Category/*.{h,m}' 
# s.source_files = 'BYKit/Category/UIView+Category/*.{h,m}' 
s.requires_arc = true 
s.framework = "Foundation","UIKit" 
end