
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/barong/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-barong"
  spec.version       = OmniAuth::Barong::VERSION
  spec.authors       = ["Louis Bellet","Yaroslav Savchuk"]
  spec.email         = ["lbellet@heliostech.fr","ysavchuk@heliostech.fr"]

  spec.summary       = %q{Authentification strategy for Barong server}
  spec.description   = %q{Barong is an opensource OAuth and KyC server}
  spec.homepage      = "https://www.peatio.tech/"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.5'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

end
