Pod::Spec.new do |s|
  s.name             = 'StratRobTestRepoWithRedux'
  s.version          = '0.1.8'
  s.summary          = 'Simple project with simple extensions.'
  s.swift_version    = '4.2'
 
  s.description      = <<-DESC
Nothing but a simple project with simple extensions.
                       DESC
 
  s.homepage         = 'https://github.com/StratRob/StratRobTestRepoWithRedux'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'StratRob' => 'dreux.robin@gmail.com' }
  s.source           = { :git => 'https://github.com/StratRob/StratRobTestRepoWithRedux.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '12.1'
  s.source_files = 'StratRobTestRepoWithRedux/**/*.swift'
  s.dependency 'ReSwift' 

end
