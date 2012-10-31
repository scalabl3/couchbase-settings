# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'couchbase_settings/version'

Gem::Specification.new do |gem|
  gem.name          = "couchbase-settings"
  gem.version       = CouchbaseSettings::VERSION
  gem.authors       = ["Jasdeep Jaitla"]
  gem.email         = ["jasdeep@scalabl3.com"]
  gem.description   = %q{A Simple Couchbase Settings gem to read RAILS_ROOT/config/couchbase.yml file}
  gem.summary       = %q{A Simple Couchbase Settings gem to read RAILS_ROOT/config/couchbase.yml file}
  gem.homepage      = "https://github.com/scalabl3/couchbase-settings"
  
  gem.extra_rdoc_files = [
    "LICENSE.txt"
  ]
  gem.files = [
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/couchbase_settings.rb",
    "lib/couchbase_settings/railtie.rb",
    "couchbase_settings.gemspec"
  ]
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
