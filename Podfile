source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
inhibit_all_warnings!
project 'BottomComponentLib.xcodeproj'


#业务依赖基础库
def library2
    #支付
    pod 'WechatOpenSDK'
    pod 'WebViewJavascriptBridge'
    pod 'UITextView+Placeholder'
    #带有动画效果的alert
    pod 'SIAlertView'
    pod 'CocoaSecurity'
    #用户引导页
    pod 'ZWIntroductionViewController'
    #自定义UICollectionViewCell高度
    pod 'UICollectionView-ARDynamicHeightLayoutCell_Bell'
    #标签流显示控件，支持文字和View
    pod 'TTGTagCollectionView'
    pod 'PinYin4Objc'
    #压缩
    pod 'SSZipArchive'
end

#工程依赖基础库
def library3
    #UI
    pod 'Masonry'
    pod 'MJRefresh'
    pod 'MBProgressHUD'
    pod 'SDWebImage'
    #cell自动适配行高
    pod 'UITableView+FDTemplateLayoutCell'
    #工具集
    pod 'YYKit'
    #分享
    pod 'UMengUShare/UI'
    pod 'UMengUShare/Social/ReducedWeChat'
    pod 'UMengUShare/Social/QQ'
    #网络
    pod 'AFNetworking'
    #统计
    pod 'UMengAnalytics-NO-IDFA','4.1.1'
    #数据库
    pod 'FMDB'
    pod 'Realm'
end






target "BottomComponentLib" do
    library2
    library3
end

