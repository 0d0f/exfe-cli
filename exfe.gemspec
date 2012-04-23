# -*- encoding: utf-8 -*-
require File.expand_path('../lib/exfe_cli/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Forrest Ye"]
  gem.email         = ["afu@forresty.com"]
  gem.description   = %q{Command line interface to exfe.com}
  gem.summary       = %q{Command line interface to exfe.com}
  gem.homepage      = "https://github.com/forresty/exfe_cli"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "exfe"
  gem.require_paths = ["lib"]
  gem.version       = ExfeCli::VERSION
end
