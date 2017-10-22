# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mprofiler/version'

Gem::Specification.new do |spec|
  spec.name          = "mprofiler"
  spec.version       = Mprofiler::VERSION
  spec.executables << 'mprofiler'
  spec.authors       = ["Duyle Campos"]
  spec.email         = ["duylecampos@gmail.com"]
  spec.description   = %q{Proccess minerador files}
  spec.summary       = %q{This gem was created to proccess minerador csv files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
