$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "carpet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "carpet"
  s.version     = Carpet::VERSION
  s.authors     = ["railsrocks"]
  s.email       = ["rzig@users.noreply.github.com"]
  s.homepage    = "https://github.com/rzig/Carpet"
  # s.summary     = "Use redcarpet to render fields in a model."
  # s.description = "Use redcarpet to render fields in a model, to make your code dry."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.2.0", "< 5.1"
  s.add_dependency "redcarpet", ">= 3.0.0"

  s.add_development_dependency "sqlite3"
end
