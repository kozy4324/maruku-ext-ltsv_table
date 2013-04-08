# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maruku-ext-ltsv_table/version'

Gem::Specification.new do |gem|
  gem.name          = "maruku-ext-ltsv_table"
  gem.version       = MaRuKu::Ext::LtsvTable::VERSION
  gem.authors       = ["kozy4324"]
  gem.email         = ["kozy4324@gmail.com"]
  gem.description   = %q{Maruku extension for table written by ltsv format.}
  gem.summary       = %q{Maruku extension for table written by ltsv format.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "maruku", "~> 0.6.0"
  gem.add_development_dependency "rspec", "~> 2.12.0"
end
