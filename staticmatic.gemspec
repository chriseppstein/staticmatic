Gem::Specification.new do |s|
  s.name     = "staticmatic"
  s.version  = "2.1.2"
  s.date     = "2008-09-11"
  s.authors  = ["Stephen Bartholomew", "Thomas Reynolds"]
  s.email    = "tdreyno@gmail.com"
  s.homepage = "http://github.com/stephenbartholomew/staticmatic"
  s.summary  = "Static sites, the Rails Way"
  s.executables = %w(staticmatic)
  s.add_dependency("templater",     ">=0.2")
  s.add_dependency("mongrel")
  s.add_dependency("haml",          ">=2.0.1")
  s.add_dependency("actionpack",    ">=2.1.0")
  s.add_dependency("activesupport", ">=2.1.0")
end