# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{logcalc}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yutaka HARA"]
  s.date = %q{2009-07-18}
  s.description = %q{Calculator app}
  s.email = %q{yutaka.hara/at/gmail.com}
  s.files = [
    "Rakefile",
     "VERSION",
     "main.rb",
     "public/calc.js",
     "public/jquery.js",
     "views/index.haml",
     "views/layout.haml",
     "views/logs.haml",
     "views/screen.sass"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/yhara/logcalc}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Calculator app}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ramaze>, ["= 2009.06.12"])
      s.add_runtime_dependency(%q<dm-core>, [">= 0"])
      s.add_runtime_dependency(%q<do_sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<ramaze>, ["= 2009.06.12"])
      s.add_dependency(%q<dm-core>, [">= 0"])
      s.add_dependency(%q<do_sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<ramaze>, ["= 2009.06.12"])
    s.add_dependency(%q<dm-core>, [">= 0"])
    s.add_dependency(%q<do_sqlite3>, [">= 0"])
  end
end
