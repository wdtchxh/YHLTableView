
Pod::Spec.new do |s|
s.name             = "YHLTableView"
s.version          = "1.0.0"
s.summary          = "tableView封装"

s.description      = <<-DESC
封装了tableview的dataSource、下拉上拉刷新、cellHeight计算
DESC

s.homepage         = "https://github.com/yanghl/YHLTableView"
s.license          = 'MIT'
s.author           = { "sean.yang" => "272789124@qq.com" }
s.source           = { :git => "https://github.com/yanghl/YHLTableView.git", :tag => s.version.to_s }
s.ios.deployment_target = '7.0'
s.source_files = 'YHLTableView/Classes/**/*.{h,c,m}'
#s.resources = 'YHLTableView/Classes/**/*.{xib,nib,plist}'
s.requires_arc = true
s.resource_bundles = {
'YHLTableView' => ['YHLTableView/Assets/**/*.png']
}
#s.watchos.deployment_target = '2.0'

s.dependency 'UITableView+FDTemplateLayoutCell'
#s.dependency 'commonLib', '~> 0.1.0'
s.dependency 'MJRefresh'
end
