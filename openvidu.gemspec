lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'openvidu/version'

Gem::Specification.new do |spec|
  spec.name        = 'openvidu'
  spec.version     = Openvidu::VERSION
  spec.date        = '2018-08-04'
  spec.summary     = %q{ Ruby gem for Openvidu REST API}
  spec.description = %{ OpenVidu WebRTC Platform allows developers to build awesome videocall applications in minutes }
  spec.authors     = ["Jorge Enríquez"]
  spec.email       = 'jenrquez@bit.lat'
  spec.homepage    = 'http://rubygemspec.org/gems/openvidu-ruby'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path = ['lib']
  spec.license       = 'MIT'

  spec.add_development_dependency "rspec", '>= 1.0.5'
  spec.add_development_dependency 'rails', '~> 4.2'
  spec.add_development_dependency 'bundler', '~> 1.13'


  spec.add_dependency 'dry-configurable', '~> 0.7.0'
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
end