
Pod::Spec.new do |spec|
  spec.name         = "BottomComponentLib"
  spec.version      = "1.0.0"
  spec.summary      = "底层组件库"
  spec.description  = <<-DESC
                        目前支持的功能有：
                      DESC
  spec.homepage     = "www.baidu.com"
  spec.license      = 'MIT'
  spec.author       = { "zf" => "1174977961@qq.com" }
  spec.source       = { :path => 'BottomComponentLib',}
  #spec.source       = { :git => "https://github.com/zhfei/BottomComponentLib.git", :commit => "a1a94661"}

  spec.platform = :ios, '8.0'
  spec.requires_arc = true
  #spec.source_files = 'SRC/**/*.{h,m,plist}'
  #spec.public_header_files = 'SRC/**/*.{h}'

  #spec.resource_bundles = {
  #   'BottomComponentLib' => [
  #     'SRC/**/*.{storyboard,xcassets,xib,plist}'
  #  ]
  #}
  
  spec.dependency 'AFNetworking'
  spec.dependency 'MBProgressHUD'
  spec.dependency 'YYModel'
  spec.dependency 'Masonry'
  spec.dependency 'FMDB'
  spec.dependency 'Realm'
  

  spec.subspec "Object-C" do |oc|
  	oc.source_files = 'SRC/Object-C/**/*.{h,m}'
  end

  spec.subspec "Swift" do |sf|
  	sf.source_files = 'SRC/Swift/**/*.{strings}'
  end

  spec.subspec "Resouce" do |rs|
    rs.source_files = 'SRC/Resouce/**/*.{storyboard,xcassets,xib,plist,strings}'
  end



 end
