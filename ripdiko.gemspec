# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ripdiko/version'

Gem::Specification.new do |gem|
  gem.name          = "ripdiko"
  gem.version       = Ripdiko::VERSION
  gem.authors       = ["Tatsuhiko Miyagawa"]
  gem.email         = ["miyagawa@bulknews.net"]
  gem.description   = %q{Radiko ripper}
  gem.summary       = %q{Streams and rip radiko.jp programs}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'nokogiri'
end
