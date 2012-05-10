# -*- encoding: utf-8 -*-
require File.expand_path('../lib/exfe_cli/version', __FILE__)
require File.expand_path('../lib/exfe_cli/common', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Forrest Ye"]
  gem.email         = ["afu@forresty.com"]
  gem.description   = ExfeCli::DESCRIPTION
  gem.summary       = ExfeCli::DESCRIPTION
  gem.homepage      = "https://github.com/forresty/exfe_cli"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "exfe"
  gem.require_paths = ["lib"]
  gem.version       = ExfeCli::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "fakeweb"

  gem.add_runtime_dependency "commander"
  gem.add_runtime_dependency "eggroll"
end
