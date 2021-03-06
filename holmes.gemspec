# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "holmes/version"

Gem::Specification.new do |s|
  s.name        = "holmes"
  s.version     = Holmes::VERSION
  s.authors     = ["Alex MacCaw"]
  s.email       = ["maccman@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Parse require calls out of JavaScript}
  s.description = s.summary

  s.rubyforge_project = "holmes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "execjs", "~>1.3.0"
end
