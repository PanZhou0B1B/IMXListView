Pod::Spec.new do |s|
  s.name         = "IMXListView"
  s.version      = "1.0.0"
  s.summary      = "Subclass of listview.Some custom cells."
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "https://github.com/PanZhow/IMXListView.git"
  s.author             = { "zhoupanpan" => "2331838272@qq.com" }
  s.source       = { :git => "https://github.com/PanZhow/IMXListView.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.platform     = :ios, '8.0'

  s.source_files  = [
    'IMXListView/ListView/*.{h,m}'
  ]
  s.public_header_files = [
    'IMXListView/ListView/*.{h}'
  ]
  s.dependency 'Masonry' ,'~> 1.1.0'
  s.dependency 'MJRefresh' ,'~> 3.1.15.1'

  s.subspec 'IMXReuseUIs' do |reuse|
    reuse.source_files  = 'IMXListView/IMXReuseUIs/*.{h,m}'
    reuse.public_header_files = [
     'IMXListView/IMXReuseUIs/*.{h}'
    ]
  end

end
