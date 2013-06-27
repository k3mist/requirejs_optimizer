# -*- encoding: utf-8 -*-
require File.expand_path('../lib/requirejs_optimizer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jesse Trimble"]
  gem.email         = ["jesseltrimble@gmail.com"]
  gem.description   = %q{A tool for optimizing Require.js modules using r.js under the asset pipeline.}
  gem.summary       = %q{A tool for optimizing Require.js modules using r.js under the asset pipeline.}
  gem.homepage      = ""

  gem.add_dependency "rails", "~> 4.0.0"
  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "requirejs_optimizer"
  gem.require_paths = ["lib"]
  gem.version       = RequirejsOptimizer::VERSION
end
