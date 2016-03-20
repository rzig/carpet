$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "carpet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "carpet"
  s.version     = Carpet::VERSION
  s.authors     = ["railsrocks"]
  s.email       = ["railsrocks@users.noreply.github.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Carpet."
  s.description = "TODO: Description of Carpet."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.beta3", "< 5.1"

  s.add_development_dependency "sqlite3"
end
