Pod::Spec.new do |s|
  s.name             = 'LA'
  s.version          = '0.2.0'
  s.summary          = 'A collection of linear algebra functions'
  s.swift_version    = '5.0'
  s.description      = <<-DESC
A small collection of linear algebra functions.
                       DESC

  s.homepage         = 'https://github.com/anconaesselmann/LA'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'anconaesselmann' => 'axel@anconaesselmann.com' }
  s.source           = { :git => 'https://github.com/anconaesselmann/LA.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '3.0'

  s.source_files = 'LA/Classes/**/*'
end
